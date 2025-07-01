import 'dart:convert';

import 'package:churchapp_flutter/models/Categories.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/appTermsScreen.dart';
import 'package:churchapp_flutter/screens/homeScreen.dart';
import 'package:churchapp_flutter/screens/pages/aboutUsScreen.dart';
import 'package:churchapp_flutter/screens/pages/bibleScreenNew.dart';
import 'package:churchapp_flutter/screens/pages/howToScreen.dart';
import 'package:churchapp_flutter/screens/pages/offeringScreen.dart';
import 'package:churchapp_flutter/screens/pages/qaListScreen.dart';
import 'package:churchapp_flutter/screens/pages/sermonScreen.dart';
import 'package:churchapp_flutter/screens/pages/toolsScreen.dart';
import 'package:churchapp_flutter/screens/privacyScreen.dart';
import 'package:churchapp_flutter/socials/UserProfileScreen.dart';
import 'package:churchapp_flutter/utils/Alerts.dart';
import 'package:churchapp_flutter/utils/components/common_item_card.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../i18n/strings.g.dart';
import '../models/Userdata.dart';
import '../providers/AppStateManager.dart';
import '../utils/ApiUrl.dart';
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

    var onTap = () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: SizedBox(width: 180, child: Text(t.chooseapplanguage)),
            content: Container(
              height: 450.0,
              width: 450.0,
              child: ListView.builder(
                primary: true,
                itemCount: appLanguageData.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var selected =
                      appLanguageData[AppLanguage.values[index]]!['name'] ==
                          language;
                  return ListTile(
                    trailing: selected
                        ? Icon(Icons.check)
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                    title: Text(
                      appLanguageData[AppLanguage.values[index]]!['name']!,
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
        },
      );
    };
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        Transform.scale(
          scale: 1.1,
          child: Image.asset(
            Img.get('new/bg_home.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //replace all with CommonItemCard
                CommonItemCard(
                  title: t.home,
                  height: 65,
                  borderSize: 2,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 40,
                    color: Colors.black54,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                ),
                SizedBox(height: 10),

                CommonItemCard(
                  title: t.sermons,
                  height: 65,
                  borderSize: 2,
                  icon: Image.asset(
                    'assets/images/new/Sermons.png',
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SermonScreen.routeName);
                  },
                ),

                SizedBox(height: 10),

                CommonItemCard(
                  title: t.biblebooks,
                  height: 65,
                  borderSize: 2,
                  icon: Image.asset(
                    'assets/images/new/bible1.png',
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, BibleScreenNew.routeName);
                  },
                ),
                SizedBox(height: 10),

                CommonItemCard(
                  title: 'Q&A',
                  height: 65,
                  borderSize: 2,
                  icon: Image.asset(
                    Img.get('new/qa1.png'),
                    height: 40,
                    width: 40,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, QAListScreen.routeName);
                  },
                ),
                SizedBox(height: 10),

                CommonItemCard(
                  title: t.tools,
                  height: 65,
                  borderSize: 2,
                  icon: Image.asset(
                    'assets/images/new/tools.png',
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ToolsScreen.routeName,
                      arguments: ScreenArguements(
                        position: 0,
                        items: Categories(
                          id: 28,
                          mediaCount: 1,
                          thumbnailUrl: '',
                          title: 'Tools',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),

                CommonItemCard(
                  title: t.offering,
                  height: 65,
                  borderSize: 2,
                  icon: Image.asset(
                    'assets/images/new/offer.png',
                    width: 40,
                    height: 40,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, OfferingScreen.routeName);
                  },
                ),
                SizedBox(height: 10),
                CommonItemCard(
                  title: t.howTo,
                  height: 65,
                  borderSize: 2,
                  icon: Image.asset(
                    Img.get('new/howto.png'),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, HowToScreen.routeName);
                  },
                ),
                SizedBox(height: 10),

                CommonItemCard(
                  title: t.profile,
                  height: 65,
                  borderSize: 2,
                  icon: Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                    color: Colors.black54,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, UserProfileScreen.routeName);
                  },
                ),

                Divider(),
                ListTile(
                  title: Text(
                    t.selectLanguage,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: DropdownButton(
                    value: language,
                    items: appLanguageData.entries
                        .map((e) => DropdownMenuItem(
                              child: Text(e.value['name']!),
                              value: e.value['name'],
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      var index = appLanguageData.entries
                          .firstWhere(
                              (element) => element.value['name'] == value)
                          .key
                          .index;
                      appManager.setAppLanguage(index);
                    },
                  ),
                  leading: Icon(Icons.language),
                ),
//rate app
                ListTile(
                  title: Text(t.rate),
                  leading: Icon(Icons.star),
                  onTap: () {
                    openBrowserTab('Rate App',
                        "https://play.google.com/store/apps/details?id=com.churchapp");
                  },
                ),

                //share app
                ListTile(
                  title: Text(t.share),
                  leading: Icon(Icons.share),
                  onTap: () {
                    openBrowserTab('Share App',
                        'https://play.google.com/store/apps/details?id=com.churchapp');
                  },
                ),

                //about us
                ListTile(
                  title: Text(t.about),
                  leading: Icon(Icons.info_outline),
                  onTap: () {
                    Navigator.pushNamed(context, AboutUsNewScreen.routeName);
                  },
                ),

                //privacy policy
                ListTile(
                  title: Text(t.privacy),
                  leading: Icon(Icons.privacy_tip),
                  onTap: () {
                    Navigator.pushNamed(context, PrivacyPolicyScreen.routeName);
                  },
                ),

                //app terms
                ListTile(
                  title: Text(t.terms),
                  leading: Icon(Icons.book_outlined),
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppTermsAndConditionsScreen.routeName);
                  },
                ),

                FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 15,
                            runSpacing: 10,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.android,
                                      size: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'v' + '${snapshot.data?.version ?? ''}',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              GestureDetector(
                                onTap: () {
                                  openBrowserTab(
                                      'IT Marketz', 'https://itmarketz.com/');
                                },
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      'Developed by: ',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            size: 18,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'IT Marketz',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ],
            ),
          ),
        ),
      ]),
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
