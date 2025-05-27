import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: Container(
        padding: EdgeInsets.only(top: statusBarHeight + appBarHeight - 30),
        child: Drawer(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ChangeNotifierProvider(
            create: (context) => HomeProvider(),
            child: DrawerScreen(),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Img.get('new/bg_home.png'),
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Header
                Container(
                  width: size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color.fromARGB(255, 88, 138, 179),
                        Color.fromARGB(255, 160, 209, 224),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            Img.get('new/Logo.png'),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MY VIRTUAL',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'PASTOR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              Img.get('new/menu.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Body Content
                Expanded(
                  child: body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
