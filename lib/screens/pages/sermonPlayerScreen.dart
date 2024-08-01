import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Media.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/AudioScreensModel.dart';
import 'package:churchapp_flutter/screens/NoitemScreen.dart';
import 'package:churchapp_flutter/screens/provider/audio_controller.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SermonPlayerScreen extends StatefulWidget {
  SermonPlayerScreen({Key? key}) : super(key: key);
  static const routeName = "/SermonPlayerScreen";

  // final Media? media;

  @override
  _SermonPlayerScreenState createState() => _SermonPlayerScreenState();
}

class _SermonPlayerScreenState extends State<SermonPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioController(),
      child: ChangeNotifierProvider(
        create: (context) => AudioScreensModel(
            Provider.of<AppStateManager>(context, listen: false).userdata),
        child: MediaBody(widget: widget),
      ),
    );
  }
}

class MediaBody extends StatefulWidget {
  const MediaBody({
    super.key,
    required this.widget,
  });

  final SermonPlayerScreen widget;

  @override
  State<MediaBody> createState() => _MediaBodyState();
}

class _MediaBodyState extends State<MediaBody> {
  late AudioController _audioController;

  late AudioScreensModel mediaScreensModel;
  List<Media>? items;

  void _onRefresh() async {
    mediaScreensModel.loadItems();
  }

  void _onLoading() async {
    mediaScreensModel.loadMoreItems();
  }

  @override
  void initState() {
    super.initState();
    _audioController = Provider.of<AudioController>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 0), () {
      Provider.of<AudioScreensModel>(context, listen: false).loadItems();
    });
  }

  @override
  void dispose() {
    _audioController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaScreensModel = Provider.of<AudioScreensModel>(context);
    items = mediaScreensModel.mediaList;
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SmartRefresher(
          key: UniqueKey(),
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text(t.pulluploadmore);
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text(t.loadfailedretry);
              } else if (mode == LoadStatus.canLoading) {
                body = Text(t.releaseloadmore);
              } else {
                body = Text(t.nomoredata);
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: mediaScreensModel.refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: (mediaScreensModel.isError == true && items!.length == 0)
              ? NoitemScreen(
                  title: t.oops, message: t.dataloaderror, onClick: _onRefresh)
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'howTo Pray',
                        style: TextStyles.title(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Worship Audio',
                        style: TextStyles.title(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      // PlayerNew(
                      //   audioUrl: '',
                      //   onNext: () {},
                      //   onPrevious: () {},
                      // ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Sermon Audio',
                        style: TextStyles.title(context).copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      // PlayerNew(
                      //   audioUrl: widget.media?.streamUrl ?? '',
                      //   onNext: () {},
                      //   onPrevious: () {},
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          'testing....',
                          style: TextStyles.title(context).copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
