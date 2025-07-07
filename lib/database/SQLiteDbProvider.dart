import 'dart:async';
import 'dart:io';

import 'package:churchapp_flutter/models/SermonMedia.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Userdata.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "sermons.db");
    return await openDatabase(
      path,
      version: 4,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(SermonMedia.CREATE_TABLE_QUERY);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion < 4) {
          // Drop the old table and create a new one
          await db.execute("DROP TABLE IF EXISTS ${SermonMedia.TABLE_NAME}");
          await db.execute(SermonMedia.CREATE_TABLE_QUERY);
        }
      },
    );
  }

  Future<void> _ensureTablesExist(Database db) async {
    // Check if tables exist and create them if they don't
    try {
      // Check if userdata table exists
      await db.query(Userdata.TABLE);
    } catch (e) {
      print("Creating userdata table as it doesn't exist");
      await db.execute('''
        CREATE TABLE IF NOT EXISTS ${Userdata.TABLE} (
          email TEXT,
          name TEXT,
          coverPhoto TEXT,
          avatar TEXT,
          gender TEXT,
          dateOfBirth TEXT,
          phone TEXT,
          aboutMe TEXT,
          location TEXT,
          qualification TEXT,
          facebook TEXT,
          twitter TEXT,
          linkdln TEXT,
          activated INTEGER
        )
      ''');
    }

    try {
      // Check if sermon downloads table exists
      await db.query(SermonMedia.TABLE_NAME);
    } catch (e) {
      print("Creating sermon downloads table as it doesn't exist");
      await db.execute(SermonMedia.CREATE_TABLE_QUERY);
    }
  }

  //userdata crud
  Future<Userdata?> getUserData() async {
    try {
      final db = await database;
      await _ensureTablesExist(db);
      List<Map> results = await db.query(
        Userdata.TABLE,
        columns: Userdata.columns,
      );
      List<Userdata> userdatalist = [];
      results.forEach((result) {
        Userdata userdata = Userdata.fromMap(result as Map<String, dynamic>);
        userdatalist.add(userdata);
      });
      return userdatalist.isNotEmpty ? userdatalist[0] : null;
    } catch (e) {
      print("Error getting user data: $e");
      return null;
    }
  }

  Future<bool> insertUser(Userdata userdata) async {
    try {
      final db = await database;
      await _ensureTablesExist(db);
      await db.insert(
        Userdata.TABLE,
        userdata.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      print("Error inserting user: $e");
      return false;
    }
  }

  Future<bool> deleteUserData() async {
    try {
      final db = await database;
      await db.delete(Userdata.TABLE);
      return true;
    } catch (e) {
      print("Error deleting user data: $e");
      return false;
    }
  }

  Future<bool> isSermonDownloaded(int id) async {
    final db = await database;
    var res = await db
        .query(SermonMedia.TABLE_NAME, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty;
  }

  Future<bool> insertDownload(SermonMedia sermon) async {
    try {
      final db = await database;
      await db.insert(
        SermonMedia.TABLE_NAME,
        sermon.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('✅ Successfully saved sermon to database: ${sermon.title}');
      return true;
    } catch (e) {
      print("❌ Error inserting download: $e");
      return false;
    }
  }

  Future<List<SermonMedia>> getDownloadedSermons() async {
    final db = await database;
    var res = await db.query(SermonMedia.TABLE_NAME);
    List<SermonMedia> list =
        res.isNotEmpty ? res.map((c) => SermonMedia.fromMap(c)).toList() : [];
    return list;
  }

  Future<bool> deleteSermon(int id) async {
    try {
      final db = await database;
      print('🗑️ Deleting sermon with id: $id');

      // First get the sermon to find its local file path
      var results = await db.query(
        SermonMedia.TABLE_NAME,
        where: "id = ?",
        whereArgs: [id],
      );

      if (results.isNotEmpty) {
        var sermon = SermonMedia.fromMap(results.first);

        // Delete the local file if it exists
        if (sermon.localPath != null) {
          try {
            final file = File(sermon.localPath!);
            if (await file.exists()) {
              await file.delete();
              print('🗑️ Deleted local file: ${sermon.localPath}');
            }
          } catch (e) {
            print('⚠️ Error deleting local file: $e');
          }
        }

        // Delete from database
        await db.delete(
          SermonMedia.TABLE_NAME,
          where: "id = ?",
          whereArgs: [id],
        );
        print('✅ Successfully deleted sermon from database');
        return true;
      }
      return false;
    } catch (e) {
      print("❌ Error deleting sermon: $e");
      return false;
    }
  }

  Future<int> getTotalSavedSermons() async {
    try {
      final db = await database;
      var result = await db.rawQuery(
          'SELECT COUNT(*) as count FROM ${SermonMedia.TABLE_NAME} WHERE isDownloaded = 1');
      return Sqflite.firstIntValue(result) ?? 0;
    } catch (e) {
      print("❌ Error getting total saved sermons: $e");
      return 0;
    }
  }

  Future<bool> addOrUpdateSermon(SermonMedia sermon) async {
    try {
      final db = await database;

      // Check if sermon exists
      final List<Map<String, dynamic>> result = await db.query(
        SermonMedia.TABLE_NAME,
        where: 'id = ?',
        whereArgs: [sermon.id],
      );

      if (result.isNotEmpty) {
        // Update existing sermon
        await db.update(
          SermonMedia.TABLE_NAME,
          {
            'title': sermon.title,
            'description': sermon.description,
            'streamUrl': sermon.streamUrl,
            'worshipStreamUrl': sermon.worshipStreamUrl,
            'isDownloaded': 1,
            'downloadStatus': 'completed'
          },
          where: 'id = ?',
          whereArgs: [sermon.id],
        );
      } else {
        // Insert new sermon
        await db.insert(
          SermonMedia.TABLE_NAME,
          {
            'id': sermon.id,
            'title': sermon.title,
            'description': sermon.description,
            'streamUrl': sermon.streamUrl,
            'worshipStreamUrl': sermon.worshipStreamUrl,
            'isDownloaded': 1,
            'downloadStatus': 'completed'
          },
        );
      }
      return true;
    } catch (e) {
      print('❌ Error saving sermon to database: $e');
      return false;
    }
  }

  Future<bool> deleteAllSermons() async {
    try {
      final db = await database;

      // Get all downloaded sermons to delete their files
      final List<Map<String, dynamic>> sermons =
          await db.query(SermonMedia.TABLE_NAME);

      // Delete physical files
      for (var sermon in sermons) {
        final streamUrl = sermon['streamUrl'] as String?;
        final worshipUrl = sermon['worshipStreamUrl'] as String?;

        if (streamUrl != null) {
          final file = File(streamUrl);
          if (await file.exists()) {
            await file.delete();
            print('🗑️ Deleted sermon audio file: $streamUrl');
          }
        }

        if (worshipUrl != null) {
          final file = File(worshipUrl);
          if (await file.exists()) {
            await file.delete();
            print('🗑️ Deleted worship audio file: $worshipUrl');
          }
        }
      }

      // Clear the database
      await db.delete(SermonMedia.TABLE_NAME);
      print('🗑️ Cleared sermon database');
      return true;
    } catch (e) {
      print('❌ Error deleting all sermons: $e');
      return false;
    }
  }
}

// A function to loop and insert bibles in the background
/*batchinsertbible(List<Bible> bibleList) async {
  Database db = await SQLiteDbProvider.db!.database;
  db!.transaction((txn) async {
    Batch batch = txn.batch();
    bibleList.forEach((bible) {
      batch.insert(Bible.TABLE, bible.toMap());
    });
    batch.commit();
  });
}*/
