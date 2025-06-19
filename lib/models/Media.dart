class Media {
  final int? id;
  int? commentsCount, likesCount, previewDuration, duration, viewsCount;
  final String? category,
      title,
      coverPhoto,
      mediaType,
      videoType,
      source,
      extraSource;
  final String? description, downloadUrl, streamUrl;
  final bool? canPreview, canDownload, isFree, http;
  bool? userLiked;

  Media({
    this.id,
    this.category,
    this.title,
    this.coverPhoto,
    this.mediaType,
    this.videoType,
    this.description,
    this.downloadUrl,
    this.canPreview,
    this.canDownload,
    this.isFree,
    this.userLiked,
    this.http,
    this.duration,
    this.commentsCount,
    this.likesCount,
    this.previewDuration,
    this.streamUrl,
    this.viewsCount,
    this.source,
    this.extraSource,
  });

  static const String BOOKMARKS_TABLE = "bookmarks";
  static const String PLAYLISTS_TABLE = "media_playlists";
  static final bookmarkscolumns = [
    "id",
    "category",
    "title",
    "coverPhoto",
    "mediaType",
    "videoType",
    "description",
    "downloadUrl",
    "canPreview",
    "canDownload",
    "isFree",
    "userLiked",
    "http",
    "duration",
    "commentsCount",
    "likesCount",
    "previewDuration",
    "streamUrl",
    "viewsCount"
  ];
  static final playlistscolumns = [
    "id",
    "playlistId",
    "category",
    "title",
    "coverPhoto",
    "mediaType",
    "videoType",
    "description",
    "downloadUrl",
    "canPreview",
    "canDownload",
    "isFree",
    "userLiked",
    "http",
    "duration",
    "commentsCount",
    "likesCount",
    "previewDuration",
    "streamUrl",
    "viewsCount"
  ];

  factory Media.fromJson(Map<String, dynamic> json) {
    //print(json);
    int? id = json['id'] != null ? int.tryParse(json['id'].toString()) : null;
    return Media(
        id: id,
        category: json['category'] as String?,
        title: json['title'] as String?,
        coverPhoto: json['cover_photo'] as String?,
        mediaType: json['type'] as String?,
        videoType: json['video_type'] as String?,
        description: json['description'] as String?,
        downloadUrl: json['download_url'] as String?,
        canPreview: json['can_preview'] != null
            ? int.tryParse(json['can_preview'].toString()) == 0
            : null,
        canDownload: json['can_download'] != null
            ? int.tryParse(json['can_download'].toString()) == 0
            : null,
        isFree: json['is_free'] != null
            ? int.tryParse(json['is_free'].toString()) == 0
            : null,
        userLiked: json['user_liked'] != null
            ? bool.fromEnvironment(json['user_liked'].toString().toLowerCase())
            : null,
        http: true,
        duration: json['duration'] != null
            ? int.tryParse(json['duration'].toString())
            : null,
        commentsCount: json['comments_count'] != null
            ? int.tryParse(json['comments_count'].toString())
            : null,
        likesCount: json['likes_count'] != null
            ? int.tryParse(json['likes_count'].toString())
            : null,
        previewDuration: json['preview_duration'] != null
            ? int.tryParse(json['preview_duration'].toString())
            : null,
        streamUrl: json['stream'] as String?,
        viewsCount: json['views_count'] != null
            ? int.tryParse(json['views_count'].toString())
            : null,
        source: json['source'] as String?,
        extraSource: json['extra_source'] as String?);
  }

  factory Media.fromMap(Map<String, dynamic> data) {
    return Media(
        id: data['id'],
        category: data['category'],
        title: data['title'],
        coverPhoto: data['coverPhoto'],
        mediaType: data['mediaType'],
        videoType: data['videoType'],
        description: data['description'],
        downloadUrl: data['downloadUrl'],
        canPreview: int.parse(data['canPreview'].toString()) == 0,
        canDownload: int.parse(data['canDownload'].toString()) == 0,
        isFree: int.parse(data['isFree'].toString()) == 0,
        userLiked: int.parse(data['userLiked'].toString()) == 0,
        http: int.parse(data['http'].toString()) == 0,
        duration: data['duration'],
        commentsCount: data['commentsCount'],
        likesCount: data['likesCount'],
        previewDuration: data['previewDuration'],
        streamUrl: data['streamUrl'],
        viewsCount: data['viewsCount'],
        source: data['source'],
        extraSource: data['extraSource']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "title": title,
        "coverPhoto": coverPhoto,
        "mediaType": mediaType,
        "videoType": videoType,
        "description": description,
        "downloadUrl": downloadUrl,
        "canPreview": canPreview,
        "canDownload": canDownload,
        "isFree": isFree,
        "userLiked": userLiked,
        "http": http,
        "duration": duration,
        "commentsCount": commentsCount,
        "likesCount": likesCount,
        "previewDuration": previewDuration,
        "streamUrl": streamUrl,
        "viewsCount": viewsCount,
        "source": source,
        "extraSource": extraSource
      };
}
