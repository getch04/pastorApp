import 'dart:convert';
// import '../models/LiveStreams.dart';
//import 'package:music_player/music_player.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../models/Media.dart';

class Utility {
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String getBase64EncodedString(String text) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(text.trim());
  }

  static String getBase64DecodedString(String text) {
    //print(text);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.decode(text.trim());
  }

  static String getFileExtension(String link) {
    String ext = "mp4";
    if (link.contains(".")) {
      ext = link.substring(link.lastIndexOf("."));
    }
    return ext.replaceAll(".", "");
  }

  static List<Media?> extractMediaByType(List<Media?> mediaList, String? type) {
    List<Media?> newList = [];
    for (Media? item in mediaList) {
      if (item!.mediaType == type) {
        newList.add(item);
      }
    }
    return newList;
  }

  static List<Media?> removeCurrentMediaFromList(
      List<Media?> mediaList, Media? media) {
    List<Media?> playlist = [];
    for (Media? item in mediaList) {
      if (item!.id != media!.id) {
        playlist.add(item);
      }
    }
    return playlist;
  }

  // static List<LiveStreams> removeCurrentLiveStreamsFromList(
  //     List<LiveStreams> mediaList, LiveStreams media) {
  //   List<LiveStreams> playlist = [];
  //   for (LiveStreams item in mediaList) {
  //     if (item.id != media.id) {
  //       playlist.add(item);
  //     }
  //   }
  //   return playlist;
  // }

  static bool isPreviewDuration(
      Media? media, int currentDuration, bool isUserSubscribed) {
    if (isUserSubscribed) return false;
    if (media!.isFree!) return false;
    if (currentDuration >= media.previewDuration!) {
      return true;
    }
    return false;
  }

  static bool isMediaRequireUserSubscription(
      Media? media, bool isUserSubscribed) {
    if (isUserSubscribed) return false;
    if (!media!.isFree! && media.previewDuration == 0) {
      return true;
    }
    return false;
  }

  /// Reconstructs local file paths using current app directory
  /// This fixes issues where absolute paths change between app launches
  static Future<String> getCorrectLocalPath(String originalPath) async {
    if (!originalPath.startsWith('/')) {
      return originalPath; // Not a local path, return as is
    }

    try {
      // Extract just the filename from the stored path
      final fileName = path.basename(originalPath);

      // Reconstruct the path using current app directory
      final appDir = await getApplicationDocumentsDirectory();
      final audioDir = Directory('${appDir.path}/sermon_audio');

      // Ensure the directory exists
      if (!await audioDir.exists()) {
        await audioDir.create(recursive: true);
      }

      final correctPath = path.join(audioDir.path, fileName);
      return correctPath;
    } catch (e) {
      print('Error reconstructing path: $e');
      return originalPath; // Fallback to original path
    }
  }

  /// Checks if a local file exists at the correct path
  static Future<bool> localFileExists(String originalPath) async {
    final correctPath = await getCorrectLocalPath(originalPath);
    return File(correctPath).existsSync();
  }
}
