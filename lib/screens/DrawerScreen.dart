import 'dart:convert';

import 'package:churchapp_flutter/notes/NotesListScreen.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/EventsListScreen.dart';
import 'package:churchapp_flutter/screens/InboxListScreen.dart';
import 'package:churchapp_flutter/utils/Alerts.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';

import '../auth/LoginScreen.dart';
import '../i18n/strings.g.dart';
import '../models/Userdata.dart';
import '../providers/AppStateManager.dart';
import '../screens/BookmarkScreen.dart';
import '../screens/PlaylistsScreen.dart';
import '../socials/SocialActivity.dart';
import '../socials/UpdateUserProfile.dart';
import '../utils/ApiUrl.dart';
import '../utils/TextStyles.dart';
import '../utils/app_themes.dart';
import '../utils/langs.dart';
import '../utils/my_colors.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late AppStateManager appManager;
  Userdata? userdata;

  Future<void> showLogoutAlert() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text(t.logoutfromapp),
              content: new Text(t.logoutfromapphint),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                    appManager.unsetUserData();
                    _handleSignOut();
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  Future<void> _handleSignOut() async {}

  openBrowserTab(String title, String url) async {
    await FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        toolbarColor: MyColors.primary,
        secondaryToolbarColor: MyColors.primary,
        navigationBarColor: MyColors.primary,
        addDefaultShareMenuItem: true,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: MyColors.primary,
        preferredControlTintColor: MyColors.primary,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }

  @override
  initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).loadItems();
  }

  @override
  Widget build(BuildContext context) {
    appManager = Provider.of<AppStateManager>(context);
    userdata = appManager.userdata;
    bool themeSwitch = appManager.themeData == appThemeData[AppTheme.Dark];
    String language = appLanguageData[
        AppLanguage.values[appManager.preferredLanguage]]!['name']!;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                (userdata != null && userdata!.coverPhoto != "")
                    ? Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(userdata!.coverPhoto!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 160,
                      ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
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
                  child: Column(
                    children: <Widget>[
                      (userdata != null && userdata!.avatar != "")
                          ? Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(userdata!.avatar!),
                                    fit: BoxFit.fill),
                              ),
                            )
                          : CircleAvatar(
                              radius: 20,
                              backgroundColor: MyColors.primary,
                              child: Icon(
                                Icons.account_circle,
                                //color: Colors.white,
                                size: 40,
                              ),
                            ),
                      Container(height: 10),
                      Text(userdata == null ? t.guestuser : userdata!.name!,
                          style:
                              TextStyles.title(context).copyWith(fontSize: 17)),
                      Container(height: 3),
                      Container(
                        height: 12,
                      ),
                      Container(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          child: Text(
                            userdata != null ? t.logout : t.login,
                            style: TextStyle(color: MyColors.primary),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            if (userdata != null) {
                              showLogoutAlert();
                            } else {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(height: 15),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PlaylistsScreen.routeName);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.playlist_play,
                              size: 20.0, color: MyColors.primary),
                          Container(width: 10),
                          Text(t.myplaylists,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 15),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, BookmarksScreen.routeName);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.collections_bookmark,
                              size: 20.0, color: MyColors.primary),
                          Container(width: 10),
                          Text(t.bookmarks,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 15),
                  InkWell(
                    onTap: () {
                      if (userdata == null) {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      } else if (userdata!.activated == 1) {
                        showDialog(
                          context: context,
                          builder: (context) => new CupertinoAlertDialog(
                            title: new Text(t.updateprofile),
                            content: new Text(t.updateprofilehint),
                            actions: <Widget>[
                              new ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: new Text(t.cancel),
                              ),
                              new ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(
                                      context, UpdateUserProfile.routeName);
                                },
                                child: new Text(t.ok),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.pushNamed(context, SocialActivity.routeName);
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.group,
                              size: 20.0, color: MyColors.primary),
                          Container(width: 10),
                          SizedBox(
                            width: 180,
                            child: Text(t.gosocial,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                          ),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 15),
                  Divider(height: 1, color: Colors.grey),
                  Container(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EventsListScreen.routeName);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.event, size: 20.0),
                          Container(width: 10),
                          Text('Events',
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, InboxListScreenState.routeName);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.inbox, size: 20.0),
                          Container(width: 10),
                          Text('Inbox',
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 8),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, NotesListScreen.routeName);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.note, size: 20.0),
                          Container(width: 10),
                          Text('Notes',
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 8),
                  InkWell(
                    onTap: () {
                      openSocialBrowserTab(ApiUrl.DONATE);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.monetization_on, size: 20.0),
                          Container(width: 10),
                          Text('Offering',
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[400]),
                        ],
                      ),
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey),
                  Container(height: 8),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: SizedBox(
                                  width: 180, child: Text(t.chooseapplanguage)),
                              content: Container(
                                height: 250.0,
                                width: 400.0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: appLanguageData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var selected = appLanguageData[AppLanguage
                                            .values[index]]!['name'] ==
                                        language;
                                    return ListTile(
                                      trailing: selected
                                          ? Icon(Icons.check)
                                          : Container(
                                              height: 0,
                                              width: 0,
                                            ),
                                      title: Text(
                                        appLanguageData[AppLanguage
                                            .values[index]]!['name']!,
                                      ),
                                      onTap: () {
                                        appManager.setAppLanguage(index);
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.language, size: 20.0),
                          Container(width: 10),
                          Text(t.selectlanguage,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Text(
                            language,
                            style: TextStyles.subhead(context).copyWith(
                                color: MyColors.primary, fontSize: 13),
                          ),
                          Container(width: 10)
                        ],
                      ),
                    ),
                  ),
                  Container(height: 0),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.color_lens, size: 20.0),
                          Container(width: 10),
                          Text(t.nightmode,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Switch(
                            value: themeSwitch,
                            onChanged: (value) {
                              appManager.setTheme(
                                  value ? AppTheme.Dark : AppTheme.White);
                            },
                            activeColor: MyColors.primary,
                            inactiveThumbColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(height: 0),
                  Visibility(
                    visible: false,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.video_library, size: 20.0),
                            Container(width: 10),
                            SizedBox(
                              width: 180,
                              child: Text(t.autoplayvideos,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.subhead(context).copyWith(
                                    fontSize: 15,
                                  )),
                            ),
                            Spacer(),
                            Switch(
                              value: appManager.autoPlayVideos,
                              onChanged: (value) {
                                appManager.setAutoPlayVideos(value);
                              },
                              activeColor: MyColors.primary,
                              inactiveThumbColor: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(height: 20),
                  Divider(height: 1, color: Colors.grey),
                  Container(height: 20),
                  InkWell(
                    onTap: () async {
                      final InAppReview inAppReview = InAppReview.instance;

                      if (await inAppReview.isAvailable()) {
                        inAppReview.requestReview();
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.rate_review,
                              size: 20.0, color: Colors.grey[500]),
                          Container(width: 10),
                          Text(t.rate,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[300]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 10),
                  InkWell(
                    onTap: () {
                      openBrowserTab(t.about, ApiUrl.ABOUT);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.info, size: 20.0, color: Colors.grey[500]),
                          Container(width: 10),
                          Text(t.about,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[300]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 10),
                  InkWell(
                    onTap: () {
                      openBrowserTab(t.terms, ApiUrl.TERMS);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.chrome_reader_mode,
                              size: 20.0, color: Colors.grey[500]),
                          Container(width: 10),
                          Text(t.terms,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[300]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 10),
                  InkWell(
                    onTap: () {
                      openBrowserTab(t.privacy, ApiUrl.PRIVACY);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.label_important,
                              size: 20.0, color: Colors.grey[500]),
                          Container(width: 10),
                          Text(t.privacy,
                              style: TextStyles.subhead(context).copyWith(
                                fontSize: 15,
                              )),
                          Spacer(),
                          Icon(Icons.navigate_next,
                              size: 25.0, color: Colors.grey[300]),
                        ],
                      ),
                    ),
                  ),
                  Container(height: 10),
                  InkWell(
                    onTap: () {
                      showDeleteAccountAlert();
                    },
                    child: Visibility(
                      visible: userdata != null,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.delete_forever,
                                size: 20.0, color: Colors.red[500]),
                            Container(width: 10),
                            Text(t.deleteaccount,
                                style: TextStyles.subhead(context).copyWith(
                                  fontSize: 15,
                                )),
                            Spacer(),
                            Icon(Icons.navigate_next,
                                size: 25.0, color: Colors.grey[300]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(height: 10),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Text(
                  "Follow us on",
                  style: TextStyles.headline(context).copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: "serif",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      openSocialBrowserTab(
                          homeProvider.data['facebook_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_facebook.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(width: 10),
                  InkWell(
                    onTap: () {
                      openSocialBrowserTab(
                          homeProvider.data['youtube_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_youtube.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(width: 10),
                  InkWell(
                    onTap: () {
                      openSocialBrowserTab(
                          homeProvider.data['twitter_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_twitter.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Container(width: 10),
                  InkWell(
                    onTap: () {
                      openSocialBrowserTab(
                          homeProvider.data['instagram_page'] as String);
                    },
                    child: Container(
                      child: Image.asset(Img.get('img_social_instagram.png')),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDeleteAccountAlert() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: new Text(t.deleteaccount),
              content: new Text(t.deleteaccounthint),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                    deleteAccountServer(userdata!.email!);
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: false,
                  child: Text(t.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  Future<void> deleteAccountServer(String email) async {
    Alerts.showProgressDialog(context, t.processingpleasewait);
    try {
      var data = {
        "email": email,
      };
      final response = await Dio()
          .post(ApiUrl.DELETE_ACCOUNT, data: jsonEncode({"data": data}));
      Navigator.of(context).pop();
      if (response.statusCode == 200) {
        print(response.data);
        Alerts.show(context, "", t.deleteaccountsuccess);
        appManager.unsetUserData();
      } else {
        Alerts.show(context, "", t.error);
      }
    } catch (exception) {
      Navigator.of(context).pop();
      Alerts.show(context, "", exception.toString());
    }
  }

  openSocialBrowserTab(String url) async {
    await FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: CustomTabsOptions(
        colorScheme: CustomTabsColorScheme.dark,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: MyColors.primary,
        preferredControlTintColor: MyColors.primary,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        modalPresentationCapturesStatusBarAppearance: true,
      ),
    );
  }
}
