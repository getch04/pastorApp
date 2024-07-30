import 'dart:math';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/providers/CategoriesModel.dart';
import 'package:churchapp_flutter/screens/NoitemScreen.dart';
import 'package:churchapp_flutter/screens/pages/CategoriesMediaScreen.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:provider/provider.dart';

class SermonScreen extends StatefulWidget {
  SermonScreen({Key? key}) : super(key: key);
  static const routeName = "/SermonScreen";

  @override
  _SermonScreenState createState() => _SermonScreenState();
}

class _SermonScreenState extends State<SermonScreen> {
  @override
  Widget build(BuildContext context) {
    return SermonScreenItem();
  }
}

class SermonScreenItem extends StatefulWidget {
  SermonScreenItem({
    Key? key,
  }) : super(key: key);

  @override
  _SermonScreenItemState createState() => _SermonScreenItemState();
}

class _SermonScreenItemState extends State<SermonScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;

    final style = TextStyles.title(context)
        .copyWith(fontWeight: FontWeight.bold, fontSize: 20);
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<AudioPlayerModel>(context, listen: false)
                .currentMedia !=
            null) {
          return (await (showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
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
        // else {
        //   return (await (showDialog(
        //         context: context,
        //         builder: (context) => CupertinoAlertDialog(
        //           title: Text(t.quitapp),
        //           content: Text(t.quitappwarning),
        //           actions: <Widget>[
        //             ElevatedButton(
        //               onPressed: () => Navigator.of(context).pop(false),
        //               child: Text(t.cancel),
        //             ),
        //             ElevatedButton(
        //               onPressed: () {
        //                 SystemNavigator.pop();
        //               },
        //               child: Text(t.ok),
        //             ),
        //           ],
        //         ),
        //       ))) ??
        //       false;
        // }
      },
      child: GlobalScaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.83,
          width: MediaQuery.of(context).size.width,
          child: ChangeNotifierProvider(
            create: (context) => CategoriesModel(),
            child: Column(
              // shrinkWrap: true,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "1 Year of Sermons",
                  style: TextStyles.title(context)
                      .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SermonBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SermonBody extends StatelessWidget {
  const SermonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoriesModel categoriesModel = Provider.of<CategoriesModel>(context);
    List<Categories>? items = categoriesModel.categories;
    if (categoriesModel.isLoading) {
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    } else if (categoriesModel.isError) {
      return NoitemScreen(
          title: t.oops,
          message: t.dataloaderror,
          onClick: () {
            categoriesModel.loadItems();
          });
    } else
      return Container(
        height: MediaQuery.of(context).size.height * 0.73,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: categoriesModel.categories?.length ?? 0,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final cat = categoriesModel.categories?[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CategoriesMediaScreenNew.routeName,
                    arguments: ScreenArguements(
                      position: 0,
                      items: cat,
                    ),
                  );
                },
                child: SermonButton(
                  week: index + 1,
                  category: cat,
                ),
              ),
            );
          },
        ),
      );
  }
}

class SermonButton extends StatelessWidget {
  final int week;
  final Categories? category;

  SermonButton({required this.week, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 92, 164),
                Color(0xff0ebef4),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(3, 3),
                blurRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 62,
                        left: 30,
                        child: ArcText(
                          radius: 55,
                          text: 'WEEK',
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          startAngle: -pi / 45,
                          startAngleAlignment: StartAngleAlignment.center,
                          placement: Placement.inside,
                          direction: Direction.clockwise,
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Text(
                          '$week',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    child: Text(
                      category?.title ?? 'UNKNOWN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 65,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
