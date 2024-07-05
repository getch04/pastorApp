import 'package:flutter/material.dart';
import 'package:isolated_download_manager/isolated_download_manager.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../audio_player/player_page.dart';
import '../i18n/strings.g.dart';
import '../models/Downloads.dart';
import '../models/Media.dart';
import '../models/ScreenArguements.dart';
import '../providers/AudioPlayerModel.dart';
import '../providers/BookmarksModel.dart';
import '../providers/DownloadsModel.dart';
import '../screens/AddPlaylistScreen.dart';
import '../utils/TextStyles.dart';
import '../utils/TimUtil.dart';
import '../utils/Utility.dart';
import '../utils/rounded_bordered_container.dart';
import '../video_player/VideoPlayer.dart';
import '../widgets/MediaPopupMenu.dart';

class Downloader extends StatefulWidget with WidgetsBindingObserver {
  final TargetPlatform? platform;
  static const routeName = "/DownloadsScreen";
  final Downloads? downloads;

  Downloader({Key? key, this.downloads, this.platform}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Downloader> {
  DownloadsModel? downloadsModel;
  final TextEditingController inputController = new TextEditingController();
  bool showClear = false;
  String? filter;

  @override
  void initState() {
    inputController.addListener(() {
      setState(() {
        filter = inputController.text;
      });
    });
    Provider.of<DownloadsModel>(context, listen: false)
        .initDownloads(context, widget.downloads);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //downloadsModel.unbindBackgroundIsolate();
    inputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    downloadsModel = Provider.of<DownloadsModel>(context);

    return new Scaffold(
      appBar: AppBar(
        title: TextField(
          maxLines: 1,
          controller: inputController,
          style: new TextStyle(fontSize: 18, color: Colors.black),
          keyboardType: TextInputType.text,
          onSubmitted: (query) {
            //downloadsModel.searchDownloads(query);
          },
          /* onChanged: (term) {
            setState(() {
              showClear = (term.length > 2);
            });
            if (term.length == 0) {
              //downloadsModel.cancelSearch();
            }
          },*/
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: t.downloads,
            hintStyle: TextStyle(fontSize: 17.0, color: Colors.black),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[300]!,
                Colors.purple[100]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: <Widget>[
          showClear
              ? IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    inputController.clear();
                    showClear = false;
                    downloadsModel!.cancelSearch();
                  },
                )
              : Container(),
        ],
      ),
      /*new AppBar(
        title: new Text(Strings.downloads),

      ),*/
      body: BuildBodyPage(downloadsModel: downloadsModel, filter: filter),
    );
  }
}

class BuildBodyPage extends StatelessWidget {
  const BuildBodyPage({
    Key? key,
    required this.downloadsModel,
    required this.filter,
  }) : super(key: key);

  final DownloadsModel? downloadsModel;
  final String? filter;

  @override
  Widget build(BuildContext context) {
    if (downloadsModel!.downloadsList.length == 0) {
      return Center(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(t.noitemstodisplay,
                textAlign: TextAlign.center, style: TextStyles.medium(context)),
          ),
        ),
      );
    }
    return ListView.builder(
        itemCount: downloadsModel!.downloadsList.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(3),
        itemBuilder: (BuildContext context, int index) {
          return filter == null || filter == ""
              ? ItemTile(
                  index: index,
                  object: downloadsModel!.downloadsList[index],
                  downloadsModel: downloadsModel!)
              : downloadsModel!.downloadsList[index].title!
                      .toLowerCase()
                      .contains(filter!.toLowerCase())
                  ? ItemTile(
                      index: index,
                      object: downloadsModel!.downloadsList[index],
                      downloadsModel: downloadsModel!)
                  : new Container();
        });
  }
}

class ItemTile extends StatefulWidget {
  final Downloads object;
  final int index;
  final DownloadsModel downloadsModel;

  const ItemTile({
    Key? key,
    required this.index,
    required this.object,
    required this.downloadsModel,
  }) : super(key: key);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    Media media = Downloads.mapMediaFromDownload(widget.object);
    return InkWell(
      onTap: () {
        if (widget.object.state == DownloadState.finished) {
          if (widget.object.mediaType!.toLowerCase() == "audio") {
            Provider.of<AudioPlayerModel>(context, listen: false)
                .preparePlaylist(
                    Downloads.mapMediaListFromDownloadList(
                        widget.downloadsModel.downloadsList),
                    Downloads.mapMediaFromDownload(widget.object));
            Navigator.of(context).pushNamed(PlayPage.routeName);
          } else {
            Navigator.pushNamed(context, VideoPlayer.routeName,
                arguments: ScreenArguements(
                  position: 0,
                  items: Downloads.mapMediaFromDownload(widget.object),
                  itemsList: Utility.extractMediaByType(
                      Downloads.mapMediaListFromDownloadList(
                          widget.downloadsModel.downloadsList),
                      widget.object.mediaType),
                ));
          }
        }
      },
      child: RoundedContainer(
        padding: const EdgeInsets.all(0),
        margin: EdgeInsets.all(5),
        height: 130,
        child: Row(
          children: <Widget>[
            widget.object.coverPhoto! == ""
                ? Container()
                : Container(
                    width: 130,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(widget.object.coverPhoto!),
                      fit: BoxFit.cover,
                    )),
                  ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Colors.blue,
                      height: 40,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Text(TimUtil.timeFormatter(widget.object.duration!),
                              style: TextStyles.caption(context)
                              //.copyWith(color: MyColors.grey_60),
                              ),
                          Spacer(),
                          Text(widget.object.viewsCount.toString() + " view(s)",
                              style: TextStyles.caption(context)
                              //.copyWith(color: MyColors.grey_60),

                              ),
                          Container(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.object.title!,
                        overflow: TextOverflow.fade,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    widget.object.state == DownloadState.finished
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AddPlaylistScreen.routeName,
                                    arguments: ScreenArguements(
                                      position: 0,
                                      items: Downloads.mapMediaFromDownload(
                                          widget.object),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.playlist_add_sharp,
                                  size: 20,
                                  color: Colors.grey[700],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  widget.downloadsModel
                                      .deleteExistingMedia(widget.object.id);
                                },
                                icon: Icon(
                                  LineAwesomeIcons.trash_alt,
                                  size: 20,
                                  color: Colors.red[700],
                                ),
                              ),
                              Consumer<BookmarksModel>(
                                builder: (context, bookmarkmodel, child) {
                                  bool isBookmarked =
                                      bookmarkmodel.isMediaBookmarked(media);
                                  return IconButton(
                                    onPressed: () {
                                      if (isBookmarked) {
                                        bookmarkmodel.unBookmarkMedia(media);
                                      } else {
                                        bookmarkmodel.bookmarkMedia(media);
                                      }
                                    },
                                    icon: Icon(
                                      isBookmarked
                                          ? LineAwesomeIcons.heartbeat_solid
                                          : LineAwesomeIcons.heart,
                                      size: 20,
                                      color: isBookmarked
                                          ? Colors.pink
                                          : Colors.grey[700],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                  ShareFile.share(media);
                                },
                                icon: Icon(
                                  LineAwesomeIcons.share_alt_solid,
                                  size: 20,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 6,
                                  child: (widget.object.state ==
                                          DownloadState.queued)
                                      ? LinearProgressIndicator(
                                          backgroundColor: Colors.orangeAccent,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.red),
                                          // minHeight: 25,
                                        )
                                      : LinearProgressIndicator(
                                          value: widget.object.progress! / 100),
                                ),
                              ),
                              FittedBox(
                                  child: Row(
                                children: [
                                  Container(width: 10),
                                  widget.object.state == DownloadState.paused
                                      ? IconButton(
                                          //padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            widget.downloadsModel
                                                .resumeDownload(widget.object);
                                          },
                                          icon: Icon(
                                            Icons.play_arrow,
                                            size: 24,
                                            color: Colors.black,
                                          ))
                                      : IconButton(
                                          //padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            widget.downloadsModel
                                                .pauseDownload(widget.object);
                                          },
                                          icon: Icon(
                                            Icons.pause,
                                            size: 24,
                                            color: Colors.black,
                                          )),
                                  IconButton(
                                      onPressed: () async {
                                        widget.downloadsModel
                                            .deleteItem(widget.object);
                                      },
                                      icon: Icon(
                                        Icons.delete_forever,
                                        size: 24,
                                        color: Colors.red,
                                      )),
                                ],
                              )),
                            ],
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      /*Container(
        height: widget.object.state == DownloadState.finished ? 140 : 170,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Card(
                      margin: EdgeInsets.all(0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 60,
                        width: 60,
                        child: CachedNetworkImage(
                          imageUrl: widget.object.coverPhoto!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black12, BlendMode.darken)),
                            ),
                          ),
                          placeholder: (context, url) =>
                              Center(child: CupertinoActivityIndicator()),
                          errorWidget: (context, url, error) => Center(
                              child: Icon(
                            Icons.error,
                            color: Colors.grey,
                          )),
                        ),
                      )),
                  Container(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Text(widget.object.category!,
                                  style: TextStyles.caption(context)
                                  //.copyWith(color: MyColors.grey_60),
                                  ),
                              Spacer(),
                              Text(
                                  TimUtil.timeFormatter(
                                      widget.object.duration!),
                                  style: TextStyles.caption(context)
                                  //.copyWith(color: MyColors.grey_60),
                                  ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.object.title!,
                                maxLines: 1,
                                style: TextStyles.subhead(context).copyWith(
                                    //color: MyColors.grey_80,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                                widget.object.mediaType![0].toUpperCase() +
                                    widget.object.mediaType!.substring(1),
                                style: TextStyles.caption(context)
                                //.copyWith(color: MyColors.grey_60),
                                ),
                            Spacer(),
                            (widget.object.state == DownloadState.finished)
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: MediaPopupMenu(
                                      Downloads.mapMediaFromDownload(
                                          widget.object),
                                      isDownloads: true,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 0,
            ),
            (widget.object.state == DownloadState.finished)
                ? Container()
                : SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 10,
                            child: (widget.object.state == DownloadState.queued)
                                ? LinearProgressIndicator(
                                    backgroundColor: Colors.orangeAccent,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.red),
                                    // minHeight: 25,
                                  )
                                : LinearProgressIndicator(
                                    value: widget.object.progress! / 100),
                          ),
                        ),
                        FittedBox(
                            child: Row(
                          children: [
                            Container(width: 20),
                            widget.object.state == DownloadState.paused
                                ? IconButton(
                                    //padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      widget.downloadsModel
                                          .resumeDownload(widget.object);
                                    },
                                    icon: Icon(
                                      Icons.play_arrow,
                                      size: 30,
                                      color: Colors.black,
                                    ))
                                : IconButton(
                                    //padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      widget.downloadsModel
                                          .pauseDownload(widget.object);
                                    },
                                    icon: Icon(
                                      Icons.pause,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                            IconButton(
                                onPressed: () async {
                                  widget.downloadsModel
                                      .deleteItem(widget.object);
                                },
                                icon: Icon(
                                  Icons.delete_forever,
                                  size: 30,
                                  color: Colors.red,
                                )),
                          ],
                        )),
                      ],
                    ),
                  ),
            Divider()
          ],
        ),
      ),*/
    );
  }
}
