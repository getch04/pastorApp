import 'dart:async';
import 'dart:convert';

import 'package:churchapp_flutter/auth/ForgotPasswordScreen.dart';
import 'package:churchapp_flutter/auth/RegisterScreen.dart';
import 'package:churchapp_flutter/utils/custom_button.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../i18n/strings.g.dart';
import '../models/Userdata.dart';
import '../providers/AppStateManager.dart';
import '../utils/Alerts.dart';
import '../utils/ApiUrl.dart';
import '../utils/TextStyles.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  LoginScreen();

  @override
  LoginScreenRouteState createState() => new LoginScreenRouteState();
}

class LoginScreenRouteState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  verifyFormAndSubmit() {
    String _email = emailController.text.trim();
    String _password = passwordController.text;

    if (_email == "" || _password == "") {
      Alerts.show(context, t.error, t.emptyfielderrorhint);
    } else if (EmailValidator.validate(_email) == false) {
      Alerts.show(context, t.error, t.invalidemailerrorhint);
    } else {
      loginUser(_email, _password, "", "");
    }
  }

  Future<void> loginUser(
      String? email, String password, String? name, String type) async {
    Alerts.showProgressDialog(context, t.processingpleasewait);
    try {
      var data = {
        "email": email,
        "password": password,
        "name": name,
        "type": type,
      };
      final response = await http.post(Uri.parse(ApiUrl.LOGIN),
          body: jsonEncode({"data": data}));
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        print(response.body);
        Map<String, dynamic> res = json.decode(response.body);
        if (res["status"] == "error") {
          Alerts.show(context, t.error, res["message"]);
        } else {
          print(res["user"]);
          Provider.of<AppStateManager>(context, listen: false)
              .setUserData(Userdata.fromJson(res["user"]));

          Navigator.of(context).pop();
        }
      }
    } catch (exception) {
      Navigator.of(context).pop();
      Alerts.show(context, t.error, exception.toString());
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      appBar:
          PreferredSize(child: Container(), preferredSize: Size.fromHeight(0)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(height: 15),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Container(height: 25),
              Column(
                children: [
                  Image(
                    image: AssetImage(Img.get("icon.png")),
                    width: 100,
                    height: 100,
                  ),
                  Container(height: 5),
                  Text(t.signintocontinue,
                      style: TextStyles.subhead(context).copyWith()),
                ],
              ),
              Container(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.emailaddress,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey[400]!, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey[400]!, width: 2),
                  ),
                ),
              ),
              Container(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.password,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey[400]!, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueGrey[400]!, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              Container(height: 8),
              Container(
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    t.forgotpassword,
                    style: TextStyle(fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ForgotPasswordScreen.routeName);
                  },
                ),
              ),
              Container(height: 20),
              CustomButton(
                title: t.signin,
                onPressed: () {
                  verifyFormAndSubmit();
                },
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    t.signinforanaccount,
                    style: TextStyle(),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName);
                  },
                ),
              ),
              Container(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
