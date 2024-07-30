import 'package:churchapp_flutter/audio_player/player_carousel_new.dart';
import 'package:churchapp_flutter/models/Media.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/material.dart';

class SermonPlayerScreen extends StatefulWidget {
  SermonPlayerScreen({Key? key, required this.media}) : super(key: key);
  static const routeName = "/SermonPlayerScreen";

  final Media? media;

  @override
  _SermonPlayerScreenState createState() => _SermonPlayerScreenState();
}

class _SermonPlayerScreenState extends State<SermonPlayerScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;

    final style = TextStyles.title(context)
        .copyWith(fontWeight: FontWeight.bold, fontSize: 20);
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            // Text(
            //   'How To Pray',
            //   style: TextStyles.title(context).copyWith(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 25,
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),
            // Text(
            //   'Worship Audio',
            //   style: TextStyles.title(context).copyWith(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 25,
            //   ),
            // ),
            // PlayerNew(audioUrl: ''),
            // SizedBox(
            //   height: 25,
            // ),
            Text(
              'Sermon Audio',
              style: TextStyles.title(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            PlayerNew(audioUrl: widget.media?.streamUrl ?? ''),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                widget.media?.description ?? '',
                style: TextStyles.title(context).copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
