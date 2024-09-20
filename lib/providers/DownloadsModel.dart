import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../i18n/strings.g.dart';
import 'package:isolated_download_manager/isolated_download_manager.dart';
import 'package:path_provider/path_provider.dart';
import '../models/Downloads.dart' as DD;
import '../database/SQLiteDbProvider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

class DownloadsModel with ChangeNotifier {
  List<DD.Downloads> downloadsList = [];
  List<DD.Downloads> _downloadsList = [];
  List<DownloadRequest> requests = [];
  //List<Downloads> currentList = [];
  var controller;
  double progress = 0.0;
  String? _appDocDirNewFolder;

  DownloadsModel() {
    createFolderInAppDocDir(".churchapp");
    getDownloads();
  }

  getDownloads() async {
    downloadsList = await SQLiteDbProvider.db.getAllDownloads();
    print("downloadsList = " + downloadsList.length.toString());
    notifyListeners();
  }

  saveDownloadMedia(DD.Downloads media) async {
    //Downloads? itm =
    //    downloadsList.firstWhereOrNull((itm) => itm.id == media.id);
    //if (itm == null) {
    await SQLiteDbProvider.db.addNewDownloadItem(media);
    getDownloads();
    // }
    notifyListeners();
  }

  removeDownloadedMedia(BuildContext context, int? id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text(t.deletemedia),
              content: new Text(t.deletemediahint),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                    deleteExistingMedia(id);
                    //getDownloads();
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  DD.Downloads? isMediaInDownloads(int? id) {
    DD.Downloads? itm = downloadsList.firstWhereOrNull((itm) => itm.id == id);
    return itm;
  }

  searchDownloads(String query) {
    _downloadsList.addAll(downloadsList);
    downloadsList.clear();
    _downloadsList.forEach((p) {
      if (p.title!.contains(query) || p.description!.contains(query)) {
        downloadsList.add(p);
      }
    });
    notifyListeners();
  }

  deleteExistingMedia(int? id) async {
    DD.Downloads? downloads = isMediaInDownloads(id);
    if (downloads != null) {
      SQLiteDbProvider.db.deleteDownloadMedia(id);
      await getDownloads();
      try {
        print("filedeleteissues = " + downloads.streamUrl!);
        final file = File(downloads.streamUrl!);
        await file.delete();
      } catch (e) {
        print("filedeleteissues = " + e.toString());
        return 0;
      }
    }
  }

  cancelSearch() {
    downloadsList.addAll(_downloadsList);
    _downloadsList.clear();
    notifyListeners();
  }

  initDownloads(BuildContext context, DD.Downloads? _downloads) async {
    if (_downloads != null) {
      await deleteExistingMedia(_downloads.id);
      String _extension = p.extension(_downloads.streamUrl!);
      String filename = _downloads.id.toString() + _extension;
      final request = DownloadManager.instance.download(_downloads.streamUrl!,
          path: _appDocDirNewFolder! + "/" + filename);
      requests.add(request);
      request.events.listen((event) async {
        if (event is DownloadState) {
          print("event: $event");
          //if dispose();
          await setStatus(event, request.url);
          if (event == DownloadState.cancelled ||
              event == DownloadState.finished) {
            requests.remove(request);
          }
        } else if (event is double) {
          print("progress: ${(event * 100.0).toStringAsFixed(0)}%");
          setProgress(request.url, (event * 100).toInt());
        }
      }, onError: (error) {
        print("error $error");
        dispose();
      });

      //save download file
      _downloads.downloadUrl = _downloads.streamUrl;
      _downloads.streamUrl = _appDocDirNewFolder! + "/" + filename;
      //_downloads.status = DownloadStatus.starting;
      downloadsList.insert(0, _downloads);
      notifyListeners();
    }
  }

  setStatus(DownloadState state, String url) async {
    if (downloadsList.length > 0) {
      final task =
          downloadsList.firstWhereOrNull((task) => task.downloadUrl == url);
      if (task != null) {
        task.state = state;
        if (state == DownloadState.finished) {
          await SQLiteDbProvider.db.addNewDownloadItem(task);
        }
        notifyListeners();
      }
    }
  }

  setProgress(String url, int progress) async {
    if (downloadsList.length > 0) {
      final task =
          downloadsList.firstWhereOrNull((task) => task.downloadUrl == url);
      if (task != null) {
        task.progress = progress;
        notifyListeners();
      }
    }
  }

  pauseDownload(DD.Downloads? downloads) {
    if (requests.length > 0) {
      final task = requests
          .firstWhereOrNull((task) => task.url == downloads!.downloadUrl);
      if (task != null) {
        task.pause();
        notifyListeners();
      } else {
        print("pauseitem = cannot pause item");
      }
    }
  }

  resumeDownload(DD.Downloads? downloads) {
    if (requests.length > 0) {
      final task = requests
          .firstWhereOrNull((task) => task.url == downloads!.downloadUrl);
      if (task != null) {
        task.resume();
        notifyListeners();
      }
    }
  }

  deleteItem(DD.Downloads? downloads) async {
    DD.Downloads? itm =
        downloadsList.firstWhereOrNull((itm) => itm.id == downloads!.id);
    if (itm != null) {
      downloadsList.remove(itm);
      if (requests.length > 0) {
        final task = requests
            .firstWhereOrNull((task) => task.url == downloads!.downloadUrl);
        if (task != null) {
          task.cancel();
          requests.remove(task);
        }
      }
    }
    SQLiteDbProvider.db.deleteDownloadMedia(downloads!.id);
    notifyListeners();
  }

  DD.Downloads? isMediaInCurrentDownloads(int? id) {
    DD.Downloads? itm = downloadsList.firstWhereOrNull((itm) => itm.id == id);
    return itm;
  }

  createFolderInAppDocDir(String folderName) async {
    //Get this App Document Directory
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      _appDocDirNewFolder = _appDocDirFolder.path;
      print(
          "appDocDirNewFolder1 = " + Uri.file(_appDocDirNewFolder!).toString());
      print("appDocDirNewFolder2 = " +
          Uri.tryParse(_appDocDirNewFolder!).toString());
      print(
          "appDocDirNewFolder3 = " + p.windows.absolute(_appDocDirFolder.path));
    } else {
      //if folder not exists create folder and then return its path
      Directory appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      print("appDocDirNewFolder = " + appDocDirNewFolder.absolute.toString());
      _appDocDirNewFolder = appDocDirNewFolder.path;
    }
  }
}
