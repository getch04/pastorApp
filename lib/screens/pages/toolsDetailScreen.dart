import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Media.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/screens/pages/sermonPlayerScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/video_player/YoutubePlayer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter_quill/youtube_player_flutter_quill.dart';

class ToolsDetailScreen extends StatelessWidget {
  static const routeName = "/ToolsDetailScreen";
  final Media? media;

  const ToolsDetailScreen({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(t.quitapp),
                  content: Text(t.quitappaudiowarning),
                  actions: <Widget>[
                    TextButton(
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
              ) ??
              false;
        }
        return true;
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 50.0,
                floating: false,
                pinned: true,
                leadingWidth: 0,
                leading: null,
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  title: Center(
                    child: Text(
                      t.tools.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          media?.title ?? 'Untitled',
                          style: TextStyles.title(context).copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 16),

                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: YoutubeVideoPlayer(media: media!),
                          ),
                        ),
                        SizedBox(height: 16),

                        DynamicHtmlContent(htmlData: media?.description ?? ''),
                        // media?.description ?? 'No Description',
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class DynamicHtmlContent extends StatelessWidget {
//   final String htmlData;

//   // Constructor to accept dynamic HTML content
//   DynamicHtmlContent({required this.htmlData});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Html(
//         data: htmlData,
//         style: {
//           "span": Style(
//             backgroundColor: Colors.grey.shade200,
//             color: Colors.black87,
//             fontFamily: 'Roboto, Arial, sans-serif',
//           ),
//         },
//         onLinkTap: (url, _, __) async {
//           if (url != null) {
//             // Check if the URL can be launched
//             if (await canLaunchUrl(Uri.parse(url))) {
//               // Launch the URL
//               await launchUrl(Uri.parse(url));
//             } else {
//               throw 'Could not launch $url';
//             }
//           }
//         },
//       ),
//     );
//   }
// }
