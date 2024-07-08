import 'dart:convert';

import 'package:churchapp_flutter/i18n/strings.g.dart';
import 'package:churchapp_flutter/models/aboutus.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  static const routeName = "/PrivacyPolicyScreen";

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String? text;
  bool isLoading = true;
  Dio dio = Dio();

  Future<void> getAboutUs() async {
    try {
      var response = await dio.get(ApiUrl.ABOUTUS);
      final abtUs = AboutUs.fromJson(jsonDecode(response.data));
      setState(() {
        text = abtUs.privacy_policy;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(t.privacy),
        flexibleSpace: Container(
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
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                text ?? t.noitemstodisplay,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
    );
  }
}
