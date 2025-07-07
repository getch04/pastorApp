import 'package:churchapp_flutter/models/Media.dart';

class SermonMedia {
  int id;
  String? title;
  String? description;
  String? downloadUrl;
  String? streamUrl;
  String? worshipStreamUrl;
  String? audioTitle;
  String? audioDescription;
  String? category;
  String? coverPhoto;
  String? mediaType;
  bool isDownloaded;
  String? localPath;
  int? downloadProgress;
  String? downloadStatus; // 'pending', 'downloading', 'completed', 'failed'

  SermonMedia({
    required this.id,
    this.title,
    this.description,
    this.downloadUrl,
    this.streamUrl,
    this.worshipStreamUrl,
    this.audioTitle,
    this.audioDescription,
    this.category,
    this.coverPhoto,
    this.mediaType,
    this.isDownloaded = false,
    this.localPath,
    this.downloadProgress = 0,
    this.downloadStatus = 'pending',
  });

  // Create SermonMedia from Media model
  factory SermonMedia.fromMedia(Media media) {
    return SermonMedia(
      id: media.id ?? 0,
      title: media.title,
      description: media.description,
      downloadUrl: media.downloadUrl,
      streamUrl: media.streamUrl,
      // worshipStreamUrl: media.worshipStreamUrl,
      // audioTitle: media.audioTitle,
      // audioDescription: media.audioDescription,
      category: media.category,
      coverPhoto: media.coverPhoto,
      mediaType: media.mediaType,
    );
  }

  // Create a copy of SermonMedia with updated fields
  SermonMedia copyWith({
    bool? isDownloaded,
    String? localPath,
    int? downloadProgress,
    String? downloadStatus,
  }) {
    return SermonMedia(
      id: id,
      title: title,
      description: description,
      downloadUrl: downloadUrl,
      streamUrl: streamUrl,
      worshipStreamUrl: worshipStreamUrl,
      audioTitle: audioTitle,
      audioDescription: audioDescription,
      category: category,
      coverPhoto: coverPhoto,
      mediaType: mediaType,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      localPath: localPath ?? this.localPath,
      downloadProgress: downloadProgress ?? this.downloadProgress,
      downloadStatus: downloadStatus ?? this.downloadStatus,
    );
  }

  // Convert to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'downloadUrl': downloadUrl,
      'streamUrl': streamUrl,
      'worshipStreamUrl': worshipStreamUrl,
      'audioTitle': audioTitle,
      'audioDescription': audioDescription,
      'category': category,
      'coverPhoto': coverPhoto,
      'mediaType': mediaType,
      'isDownloaded': isDownloaded ? 1 : 0,
      'localPath': localPath,
      'downloadProgress': downloadProgress,
      'downloadStatus': downloadStatus,
    };
  }

  // Create SermonMedia from database Map
  factory SermonMedia.fromMap(Map<String, dynamic> map) {
    return SermonMedia(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      downloadUrl: map['downloadUrl'],
      streamUrl: map['streamUrl'],
      worshipStreamUrl: map['worshipStreamUrl'],
      audioTitle: map['audioTitle'],
      audioDescription: map['audioDescription'],
      category: map['category'],
      coverPhoto: map['coverPhoto'],
      mediaType: map['mediaType'],
      isDownloaded: map['isDownloaded'] == 1,
      localPath: map['localPath'],
      downloadProgress: map['downloadProgress'],
      downloadStatus: map['downloadStatus'],
    );
  }

  // Table name for SQLite
  static const String TABLE_NAME = "sermon_downloads";

  // Column names for SQLite table
  static const String CREATE_TABLE_QUERY = '''
    CREATE TABLE IF NOT EXISTS $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      title TEXT,
      description TEXT,
      downloadUrl TEXT,
      streamUrl TEXT,
      worshipStreamUrl TEXT,
      audioTitle TEXT,
      audioDescription TEXT,
      category TEXT,
      coverPhoto TEXT,
      mediaType TEXT,
      isDownloaded INTEGER,
      localPath TEXT,
      downloadProgress INTEGER,
      downloadStatus TEXT
    )
  ''';
}
