import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/aboutus.dart';
import 'package:churchapp_flutter/providers/AudioPlayerModel.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUsNewScreen extends StatefulWidget {
  AboutUsNewScreen({Key? key}) : super(key: key);
  static const routeName = "/AboutUsNewScreen";

  @override
  _AboutUsNewScreenState createState() => _AboutUsNewScreenState();
}

class _AboutUsNewScreenState extends State<AboutUsNewScreen>
    with SingleTickerProviderStateMixin {
  String? text;
  bool isLoading = true;
  Dio dio = Dio();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  Future<void> getAboutUs() async {
    try {
      var response = await dio.get(ApiUrl.ABOUTUS);
      final abtUs = AboutUs.fromJson(jsonDecode(response.data));
      setState(() {
        text = abtUs.about_us;
        isLoading = false;
      });
      _animationController.forward();
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    getAboutUs();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rich, warm color scheme inspired by traditional church aesthetics
    final Color primaryGold = Color(0xFFD4AF37);
    final Color burgundy = Color(0xFF800020);
    final Color deepBlue = Color(0xFF1A365D);
    final Color creamColor = Color(0xFFF5F5DC);
    final Color textColor = Color(0xFF333333);

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
      },
      child: GlobalScaffold(
        body: Container(
          decoration: BoxDecoration(
            // Create a rich gradient background
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                deepBlue,
                Color(0xFF2A3B5D),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header area
                Container(
                  padding: EdgeInsets.only(top: 24, bottom: 24),
                  decoration: BoxDecoration(
                    color: deepBlue.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryGold.withOpacity(0.2),
                            border: Border.all(
                              color: primaryGold,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.church,
                            size: 36,
                            color: primaryGold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          t.about.toUpperCase(),
                          style: TextStyle(
                            color: primaryGold,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: 80,
                          height: 3,
                          decoration: BoxDecoration(
                            color: burgundy,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Content area with scrollable text
                Expanded(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryGold),
                          ),
                        )
                      : FadeTransition(
                          opacity: _fadeAnimation,
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: [
                              // Decorative element
                              Container(
                                height: 80,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: -20,
                                      top: 10,
                                      child: Opacity(
                                        opacity: 0.1,
                                        child: Icon(
                                          Icons.groups,
                                          size: 70,
                                          color: primaryGold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Section header
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 18),
                                  decoration: BoxDecoration(
                                    color: burgundy,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        size: 22,
                                        color: creamColor,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "Our Story",
                                        style: TextStyle(
                                          color: creamColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Main content card
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Container(
                                  padding: EdgeInsets.all(24),
                                  decoration: BoxDecoration(
                                    color: creamColor.withOpacity(0.95),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    text ?? '',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      height: 1.6,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 40),

                              // Footer with decorative elements
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 2,
                                      color: primaryGold.withOpacity(0.5),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primaryGold.withOpacity(0.2),
                                        border: Border.all(
                                          color: primaryGold.withOpacity(0.5),
                                          width: 1,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: primaryGold,
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      height: 2,
                                      color: primaryGold.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20),

                              // Copyright or additional info
                              Center(
                                child: Text(
                                  'Serving our community with faith and love',
                                  style: TextStyle(
                                    color: creamColor.withOpacity(0.7),
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),

                              SizedBox(height: 40),
                            ],
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
