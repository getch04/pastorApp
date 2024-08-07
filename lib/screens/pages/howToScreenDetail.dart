import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/models/howto_model.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HowToDetailScreen extends StatefulWidget {
  HowToDetailScreen({Key? key, required this.howToModel}) : super(key: key);
  static const routeName = "/HowToDetailScreen";

  final HowToModel howToModel;

  @override
  _HowToDetailScreenState createState() => _HowToDetailScreenState();
}

class _HowToDetailScreenState extends State<HowToDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await showDialog<bool>(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(t.quitapp),
                  content: Text(t.quitappaudiowarning),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(t.cancel),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Provider.of<AudioPlayerModel>(context, listen: false)
                            .cleanUpResources();
                        Navigator.of(context).pop(true);
                      },
                      child: Text(t.ok),
                    ),
                  ],
                ),
              )) ??
              false;
        }
        return true;
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.howToModel.question,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      widget.howToModel.answer,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}