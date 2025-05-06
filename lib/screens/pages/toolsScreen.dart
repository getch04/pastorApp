import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/Media.dart';
import 'package:churchapp_flutter/models/ScreenArguements.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/screens/pages/toolsDetailScreen.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/TextStyles.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:churchapp_flutter/utils/langs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolsScreen extends StatefulWidget {
  ToolsScreen({Key? key}) : super(key: key);
  static const routeName = "/ToolsScreen";

  @override
  _ToolsScreenState createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';
  Dio dio = Dio();
  late AppStateManager appManager;
  List<Media> tools = [];

  Future<void> getTools() async {
    setState(() {
      isLoading = true;
      hasError = false;
      errorMessage = '';
    });

    String language =
        appLanguageData[AppLanguage.values[appManager.preferredLanguage]]
                ?['value'] ??
            'en';
    try {
      var response = await dio.get(ApiUrl.GET_TOOLS + "?lang=$language");

      // Check if response.data is not null or empty
      if (response.data == null || response.data.toString().trim().isEmpty) {
        setState(() {
          isLoading = false;
          hasError = true;
          errorMessage = 'Empty response received from server';
        });
        return;
      }

      // Try to parse the JSON safely
      Map<String, dynamic> toolsData;
      try {
        toolsData = jsonDecode(response.data);
      } catch (e) {
        print('JSON parse error: ${e.toString()}');
        setState(() {
          isLoading = false;
          hasError = true;
          errorMessage = 'Invalid response format: ${e.toString()}';
        });
        return;
      }

      if (toolsData['status'] == 'ok' &&
          toolsData.containsKey('media') &&
          toolsData['media'] != null &&
          toolsData['media'] is List) {
        try {
          final mediaList = toolsData['media'] as List;
          final parsedTools = mediaList
              .map((item) {
                try {
                  return Media.fromJson(item);
                } catch (e) {
                  print('Error parsing media item: $e');
                  // Return null for items that fail to parse
                  return null;
                }
              })
              .whereType<Media>()
              .toList(); // Filter out nulls

          setState(() {
            tools = parsedTools;
            isLoading = false;
          });
        } catch (e) {
          setState(() {
            isLoading = false;
            hasError = true;
            errorMessage = 'Failed to parse media items: ${e.toString()}';
          });
        }
      } else {
        setState(() {
          isLoading = false;
          hasError = true;
          errorMessage = 'Invalid data format received from server';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
        errorMessage = 'Failed to load tools: ${e.toString()}';
      });
      print('Network/API error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    appManager = Provider.of<AppStateManager>(context, listen: false);
    getTools();
  }

  Widget _buildErrorWidget() {
    // Define theme colors
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.red.shade100,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade400, size: 60),
          SizedBox(height: 16),
          Text(
            'Error Loading Tools',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: getTools,
            icon: Icon(Icons.refresh),
            label: Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define theme colors
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;

    return GlobalScaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  t.tools.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyles.title(context).copyWith(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 10,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              // Decorative divider
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(0.7),
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.build_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white.withOpacity(0.7),
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
              // Content Area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: isLoading
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(accentColor),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Loading tools...',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : hasError
                          ? Center(child: _buildErrorWidget())
                          : tools.isEmpty
                              ? Center(
                                  child: Container(
                                    padding: EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: accentColor.withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 10,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: accentColor,
                                          size: 50,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'No tools available',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : MediaScreen(tools: tools),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MediaScreen extends StatefulWidget {
  MediaScreen({required this.tools});

  final List<Media> tools;

  @override
  _CategoriesMediaScreenNewState createState() =>
      _CategoriesMediaScreenNewState();
}

class _CategoriesMediaScreenNewState extends State<MediaScreen> {
  @override
  Widget build(BuildContext context) {
    // Define theme colors
    final primaryColor = Colors.indigo.shade700;
    final accentColor = Colors.lightBlue.shade300;
    final lightColor = Colors.lightBlue.shade50;

    return ListView.builder(
      itemCount: widget.tools.length,
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 12.0, bottom: 100.0),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, ToolsDetailScreen.routeName,
                    arguments: ScreenArguements(
                      position: 0,
                      items: widget.tools[index],
                    ));
              },
              borderRadius: BorderRadius.circular(16),
              splashColor: accentColor.withOpacity(0.2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.05),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: lightColor.withOpacity(0.5),
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: lightColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.build_circle_outlined,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          widget.tools[index].title ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                            height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: lightColor.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: primaryColor,
                            size: 12,
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
      },
    );
  }
}
