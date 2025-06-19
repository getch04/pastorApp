import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/aboutus.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/components/global_scafold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppTermsAndConditionsScreen extends StatefulWidget {
  const AppTermsAndConditionsScreen({super.key});

  static const routeName = "/AppTermsAndConditionsScreen";

  @override
  State<AppTermsAndConditionsScreen> createState() =>
      _AppTermsAndConditionsScreenState();
}

class _AppTermsAndConditionsScreenState
    extends State<AppTermsAndConditionsScreen> {
  String? text;
  bool isLoading = true;
  Dio dio = Dio();

  Future<void> getAboutUs() async {
    try {
      var response = await dio.get(ApiUrl.ABOUTUS);
      final abtUs = AboutUs.fromJson(jsonDecode(response.data));
      setState(() {
        text = abtUs.terms_conditions;
        isLoading = false;
      });
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
    getAboutUs();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text ?? t.noitemstodisplay,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
      ),
    );
  }
}
