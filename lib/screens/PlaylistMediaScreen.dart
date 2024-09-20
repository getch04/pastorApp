import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../i18n/strings.g.dart';
import '../models/Media.dart';
import '../models/Playlists.dart';
import '../providers/PlaylistsModel.dart';
import '../utils/TextStyles.dart';
import '../widgets/MediaItemTile.dart';

class PlaylistMediaScreen extends StatelessWidget {
  static const routeName = "/playlistsmedia";
  final Playlists? playlists;
  PlaylistMediaScreen({this.playlists});

  @override
  Widget build(BuildContext context) {
    PlaylistsModel playlistsModel = Provider.of<PlaylistsModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          playlists!.title! + " " + t.playlistitm,
          maxLines: 1,
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
      ),
      body: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: FutureBuilder<List<Media>>(
            future:
                playlistsModel.getPlaylistsMedia(playlists!.id), //returns bool
            builder: (BuildContext context, AsyncSnapshot<List<Media>> value) {
              if (value.data == null) {
                return Center();
              }
              List<Media> items = value.data!;
              if (items.length == 0)
                return Center(
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(t.noitemstodisplay,
                          textAlign: TextAlign.center,
                          style: TextStyles.medium(context)),
                    ),
                  ),
                );
              else
                return Container(
                  padding: EdgeInsets.all(0),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ItemTile(
                        mediaList: items,
                        index: index,
                        object: items[index],
                      );
                    },
                  ),
                );
            }),
      ),
    );
  }
}
