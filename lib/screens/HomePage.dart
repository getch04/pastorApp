// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../providers/HomeProvider.dart';
// import '../screens/DrawerScreen.dart';
// import '../screens/SearchScreen.dart';
// import '../models/ScreenArguements.dart';
// import '../screens/Downloader.dart';
// import 'Home.dart';
// import '../utils/my_colors.dart';
// import 'package:provider/provider.dart';
// import '../i18n/strings.g.dart';
// import '../providers/AudioPlayerModel.dart';
// import 'package:flutter/cupertino.dart';
// import '../utils/rounded_clipper.dart';
// import 'dart:math';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);
//   static const routeName = "/homePage";

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return HomePageItem();
//   }
// }

// class HomePageItem extends StatefulWidget {
//   HomePageItem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _HomePageItemState createState() => _HomePageItemState();
// }

// class _HomePageItemState extends State<HomePageItem> {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (Provider.of<AudioPlayerModel>(context, listen: false)
//                 .currentMedia !=
//             null) {
//           return (await (showDialog(
//                 context: context,
//                 builder: (context) => new CupertinoAlertDialog(
//                   title: new Text(t.quitapp),
//                   content: new Text(t.quitappaudiowarning),
//                   actions: <Widget>[
//                     new ElevatedButton(
//                       onPressed: () => Navigator.of(context).pop(false),
//                       child: new Text(t.cancel),
//                     ),
//                     new ElevatedButton(
//                       onPressed: () {
//                         Provider.of<AudioPlayerModel>(context, listen: false)
//                             .cleanUpResources();
//                         Navigator.of(context).pop(true);
//                       },
//                       child: new Text(t.ok),
//                     ),
//                   ],
//                 ),
//               ))) ??
//               false;
//         } else {
//           return (await (showDialog(
//                 context: context,
//                 builder: (context) => new CupertinoAlertDialog(
//                   title: new Text(t.quitapp),
//                   content: new Text(t.quitappwarning),
//                   actions: <Widget>[
//                     new ElevatedButton(
//                       onPressed: () => Navigator.of(context).pop(false),
//                       child: new Text(t.cancel),
//                     ),
//                     new ElevatedButton(
//                       onPressed: () {
//                         SystemNavigator.pop();
//                       },
//                       child: new Text(t.ok),
//                     ),
//                   ],
//                 ),
//               ))) ??
//               false;
//         }
//       },
//       child: Scaffold(
//         /*appBar: AppBar(
//           toolbarHeight: 60.0,
//           title: Text(t.appname),
//           actions: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   borderRadius:
//                       BorderRadius.circular(AppBar().preferredSize.height),
//                   child: Icon(
//                     Icons.cloud_download,
//                     color: Colors.white,
//                   ),
//                   onTap: () {
//                     Navigator.pushNamed(context, Downloader.routeName,
//                         arguments: ScreenArguements(
//                           position: 0,
//                           items: null,
//                         ));
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: (() {
//                     Navigator.pushNamed(context, SearchScreen.routeName);
//                   })),
//             )
//           ],
//         ),*/
//         body: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipPath(
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         height: 125,
//                         decoration: BoxDecoration(
//                           color: MyColors.primary,
//                         ),
//                       ),
//                       Positioned(
//                           top: -80,
//                           left: -80,
//                           child: Container(
//                             height: MediaQuery.of(context).size.height * 0.36,
//                             width: MediaQuery.of(context).size.height * 0.36,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(
//                                   (MediaQuery.of(context).size.height * 0.36) /
//                                       2),
//                               color: MyColors.primary,
//                             ),
//                           )),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Container(
//                           height: 125,
//                           width: MediaQuery.of(context).size.width,
//                           child: CustomPaint(
//                             painter: _ArcPainter(),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   clipper: RoundedClipper(30),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 40, left: 0, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                         onPressed: () {
//                           scaffoldKey.currentState!.openDrawer();
//                         },
//                         icon: Icon(
//                           Icons.menu,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         t.appname,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 0),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Material(
//                             color: Colors.transparent,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(
//                                   AppBar().preferredSize.height),
//                               child: Icon(
//                                 Icons.cloud_download,
//                                 color: Colors.white,
//                               ),
//                               onTap: () {
//                                 Navigator.pushNamed(
//                                     context, Downloader.routeName,
//                                     arguments: ScreenArguements(
//                                       position: 0,
//                                       items: null,
//                                     ));
//                               },
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 90, left: 35, right: 35),
//                   height: 55,
//                   width: double.infinity,
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(context, SearchScreen.routeName);
//                     },
//                     child: Card(
//                       elevation: 3,
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25)),
//                       child: Row(
//                         children: <Widget>[
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Icon(
//                             Icons.search,
//                             color: Colors.grey[350],
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             t.searchhint,
//                             style: TextStyle(color: Colors.grey[350]),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Expanded(
//               child: ChangeNotifierProvider(
//                 create: (context) => HomeProvider(),
//                 child: MyHomePage(),
//               ),
//             ),
//           ],
//         ),
//         drawer: Container(
//           color: MyColors.grey_95,
//           width: 300,
//           child: Drawer(
//             child: DrawerScreen(),
//           ),
//         ),
//         key: scaffoldKey,
//       ),
//     );
//   }
// }

// class _ArcPainter extends CustomPainter {
//   _ArcPainter();

//   @override
//   bool shouldRepaint(_ArcPainter oldDelegate) {
//     return true;
//   }

//   double AVATAR_RADIUS = 160 * 0.35;

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = new Paint()
//       ..style = PaintingStyle.fill
//       ..isAntiAlias = true
//       ..color = MyColors.primary;

//     Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);

//     Offset topLeft = Offset(0, 0);
//     Offset bottomLeft = Offset(0, size.height * 0.25);
//     Offset topRight = Offset(size.width, 0);
//     Offset bottomRight = Offset(size.width, size.height * 0.25);

//     Offset leftCurveControlPoint =
//         Offset(circleCenter.dx * 0.35, size.height - AVATAR_RADIUS * 1.5);
//     Offset rightCurveControlPoint =
//         Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);

//     final arcStartAngle = 200 / 180 * pi;
//     final avatarLeftPointX =
//         circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
//     final avatarLeftPointY =
//         circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
//     Offset avatarLeftPoint =
//         Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

//     final arcEndAngle = -5 / 180 * pi;
//     final avatarRightPointX =
//         circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
//     final avatarRightPointY =
//         circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
//     Offset avatarRightPoint = Offset(
//         avatarRightPointX, avatarRightPointY); // the right point of the arc

//     Path path = Path()
//       ..moveTo(topLeft.dx,
//           topLeft.dy) // this move isn't required since the start point is (0,0)
//       ..lineTo(bottomLeft.dx, bottomLeft.dy)
//       ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy,
//           avatarLeftPoint.dx, avatarLeftPoint.dy)
//       ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
//           bottomRight.dx, bottomRight.dy)
//       ..lineTo(topRight.dx, topRight.dy)
//       ..close();

//     canvas.drawPath(path, paint);
//   }
// }
