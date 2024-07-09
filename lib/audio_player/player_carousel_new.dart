import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/AudioPlayerModel.dart';
import '../providers/MediaPlayerModel.dart';

class PlayerNew extends StatelessWidget {
  PlayerNew({this.showTableOfContent = true});

  bool? showTableOfContent;
  @override
  Widget build(BuildContext context) {
    AudioPlayerModel audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Column(
      children: _controllers(context, audioPlayerModel),
    );
  }

  Widget _timer(BuildContext context, AudioPlayerModel audioPlayerModel) {
    var style = new TextStyle(
      color: Colors.grey,
      fontSize: 15,
    );
    return StreamBuilder(
      initialData: audioPlayerModel.backgroundAudioPositionSeconds,
      stream: audioPlayerModel.audioProgressStreams.stream.asBroadcastStream(),
      builder: (BuildContext? context, dynamic snapshot) {
        double? seekSliderValue = 0;
        if (snapshot.data != null) {
          seekSliderValue = snapshot.data /
              audioPlayerModel.backgroundAudioDurationSeconds.floor();
          if (seekSliderValue!.isNaN || seekSliderValue < 0) {
            seekSliderValue = 0;
          }
          if (seekSliderValue > 1) {
            seekSliderValue = 1;
          }
          print("snapshot.data = " + snapshot.data.toString());
          print("backgroundAudioDurationSeconds = " +
              audioPlayerModel.backgroundAudioDurationSeconds.toString());
          print("seekSliderValue = " + seekSliderValue.toString());
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Text(
            //   TimUtil.stringForSeconds(
            //       (snapshot == null || snapshot.data == null)
            //           ? 0.0
            //           : snapshot.data),
            //   style: style,
            // ),
            Expanded(
              child: Slider(
                  activeColor: Colors.black,
                  value: seekSliderValue,
                  inactiveColor: Colors.black54,
                  onChangeEnd: (v) {
                    audioPlayerModel.onStartSeek();
                  },
                  onChanged: (double val) {
                    final double positionSeconds =
                        val * audioPlayerModel.backgroundAudioDurationSeconds;
                    audioPlayerModel.seekTo(positionSeconds);
                  }),
            ),
            // new Text(
            //   TimUtil.stringForSeconds(
            //       audioPlayerModel.backgroundAudioDurationSeconds),
            //   style: style,
            // ),
          ],
        );
      },
    );
  }

  List<Widget> _controllers(
      BuildContext context, AudioPlayerModel audioPlayerModel) {
    return [
      Visibility(
        visible: !audioPlayerModel.showList,
        child: new Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: _timer(context, audioPlayerModel),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {
                // widget.audioPlayerModel.shufflePlaylist();
                // Provider.of<MediaPlayerModel>(context, listen: false)
                //     .setMediaLikesCommentsCount(
                //         widget.audioPlayerModel.currentMedia!);
              },
              icon: Icon(
                Icons.shuffle,
                size: 45.0,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                audioPlayerModel.skipPrevious();
                Provider.of<MediaPlayerModel>(context, listen: false)
                    .setMediaLikesCommentsCount(audioPlayerModel.currentMedia!);
              },
              icon: Icon(
                Icons.skip_previous,
                // Icons.fast_rewind,
                size: 45.0,
                color: Colors.black,
              ),
            ),
            ClipOval(
                child: Container(
              color: MyColors.black,
              width: 70.0,
              height: 70.0,
              child: IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                onPressed: () {
                  audioPlayerModel.onPressed();
                },
                icon: audioPlayerModel.icon(),
              ),
            )),
            IconButton(
              onPressed: () {
                audioPlayerModel.skipNext();
                Provider.of<MediaPlayerModel>(context, listen: false)
                    .setMediaLikesCommentsCount(audioPlayerModel.currentMedia!);
              },
              icon: Icon(
                Icons.skip_next,
                // Icons.fast_forward,
                size: 45.0,
                color: Colors.black,
              ),
            ),

            // IconButton(
            //   onPressed: () => widget.audioPlayerModel
            //       .setShowList(!widget.audioPlayerModel.showList),
            //   icon: Icon(
            //     Icons.playlist_play,
            //     size: 27.0,
            //     color: Colors.white,
            //   ),
            // ),
            IconButton(
              // onPressed: () => widget.audioPlayerModel.changeRepeat(),
              // icon: widget.audioPlayerModel.isRepeat == true
              //     ? Icon(
              //         Icons.repeat_one,
              //         size: 26.0,
              //         color: Colors.white,
              //       )
              //     :
              onPressed: () {},
              icon: Icon(
                Icons.repeat,
                size: 45.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      if (showTableOfContent!)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Table of contents',
                  style: TextStyles.title(context),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.brightness_1, size: 15),
                          SizedBox(width: 10),
                          Text(
                            "0:00 - prayer",
                            style: TextStyles.title(context),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.brightness_1,
                            size: 15,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "0:00 - worship",
                            style: TextStyles.title(context),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.brightness_1, size: 15),
                          SizedBox(width: 10),
                          Text(
                            "0:00 - Sermon",
                            style: TextStyles.title(context),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.fast_forward,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
    ];
  }
}
