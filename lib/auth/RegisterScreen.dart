import 'dart:async';
import 'dart:convert';

import 'package:churchapp_flutter/utils/img.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/intl_phone_field.dart';

import '../i18n/strings.g.dart';
import '../utils/Alerts.dart';
import '../utils/ApiUrl.dart';
import '../utils/TextStyles.dart';
import '../utils/my_colors.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";
  RegisterScreen();

  @override
  RegisterScreenRouteState createState() => new RegisterScreenRouteState();
}

class RegisterScreenRouteState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _repeatPasswordVisible = false;

  verifyFormAndSubmit() {
    String _name = nameController.text.trim();
    String _email = emailController.text.trim();
    String _phone = phoneNumberController.text.trim();
    String _password = passwordController.text;
    String _repeatPassword = repeatPasswordController.text;

    final data = jsonEncode({
      "data": {
        "email": _email,
        "name": _name,
        "phone": _phone,
        "password": _password,
      }
    });

    print(data);

    if (_name == "" || _phone == "" || _password == "") {
      Alerts.show(context, t.error, t.emptyfielderrorhint);
    } else if (EmailValidator.validate(_email) == false) {
      Alerts.show(context, t.error, t.invalidemailerrorhint);
    } else if (_password != _repeatPassword) {
      Alerts.show(context, t.error, t.passwordsdontmatch);
    } else {
      registerUser(_email, _name, _password);
    }
  }

  Future<void> registerUser(String email, String name, String password) async {
    Alerts.showProgressDialog(context, t.processingpleasewait);
    try {
      final response = await http.post(Uri.parse(ApiUrl.REGISTER),
          body: jsonEncode({
            "data": {
              "email": email,
              "name": name,
              "password": password,
            }
          }));
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        print(response.body);
        Map<String, dynamic> res = json.decode(response.body);
        if (res["status"] == "error") {
          Alerts.show(context, t.error, res["message"]);
        } else {
          Alerts.show(context, t.success, res["message"]);
        }
        print(res);
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
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
              Container(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage(Img.get("icon.png")),
                    width: 50,
                    height: 50,
                  ),
                  Container(height: 5),
                  Text(t.createaccount,
                      style: TextStyles.subhead(context).copyWith()),
                ],
              ),
              Container(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.fullname,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: nameController,
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
                child: Text(t.phonenumber,
                    style: TextStyles.caption(context).copyWith()),
              ),
              IntlPhoneField(
                controller: phoneNumberController,
                textAlignVertical: TextAlignVertical.center,
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              Container(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.emailaddress,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                obscureText: !_passwordVisible,
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
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              Container(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(t.repeatpassword,
                    style: TextStyles.caption(context).copyWith()),
              ),
              TextField(
                controller: repeatPasswordController,
                obscureText: !_repeatPasswordVisible,
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      _repeatPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _repeatPasswordVisible = !_repeatPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              Container(height: 25),
              Container(
                width: double.infinity,
                height: 40,
                child: TextButton(
                  child: Text(
                    t.register,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: MyColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    verifyFormAndSubmit();
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    t.alreadyhaveanaccount,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                ),
              ),
              Container(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
