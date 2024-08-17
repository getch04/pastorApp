import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Media.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/video_player/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolsDetailScreen extends StatefulWidget {
  ToolsDetailScreen({Key? key, required this.media}) : super(key: key);
  static const routeName = "/ToolsDetailScreen";
  final Media? media;

  @override
  _ToolsDetailScreenState createState() => _ToolsDetailScreenState();
}

class _ToolsDetailScreenState extends State<ToolsDetailScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await (showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(t.quitapp),
                  content: Text(t.quitappaudiowarning),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(t.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: Text(t.ok),
                    ),
                  ],
                ),
              ))) ??
              false;
        }
        return true;
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              // Container(
              //   height: 70,
              //   width: 100,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 50),
              //     child: CommonItemCard(
              //       title: t.tools,
              //       icon: Image.asset(
              //         Img.get('new/tools.png'),
              //         width: 40,
              //         height: 40,
              //       ),
              //       onTap: () {},
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Text(
                t.tools.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyles.title(context).copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 10,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.media?.title ?? 'Untitled',
                      textAlign: TextAlign.center,
                      style: TextStyles.title(context).copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Text(
                  //   "Teaching goes here...",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyles.title(context).copyWith(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //   ),
                  // ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: VideoPlayer(
                  media: widget.media,
                  mediaList: [widget.media!],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
