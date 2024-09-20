import 'dart:convert';

import 'package:app_links/app_links.dart';
import 'package:churchapp_flutter/models/Userdata.dart';
import 'package:churchapp_flutter/providers/AppStateManager.dart';
import 'package:churchapp_flutter/providers/HomeProvider.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/screens/pages/thankYouPage.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:provider/provider.dart';

class OfferingScreen extends StatefulWidget {
  OfferingScreen({Key? key}) : super(key: key);
  static const routeName = "/OfferingScreen";

  @override
  _OfferingScreenState createState() => _OfferingScreenState();
}

class _OfferingScreenState extends State<OfferingScreen> {
  @override
  Widget build(BuildContext context) {
    return OfferingScreenItem();
  }
}

class OfferingScreenItem extends StatefulWidget {
  OfferingScreenItem({Key? key}) : super(key: key);

  @override
  _OfferingScreenItemState createState() => _OfferingScreenItemState();
}

class _OfferingScreenItemState extends State<OfferingScreenItem> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode _textFieldFocusNode = FocusNode();
  double _donationAmount = 10.0;
  final List<double> _presetAmounts = [5, 10, 25, 50, 100];
  bool _showCustomAmount = false;

  // late AppLinks _appLinks;

  final TextEditingController _customAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _initializeDeepLinks();
    _customAmountController.text = _donationAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  // void _initializeDeepLinks() async {
  //   _appLinks = AppLinks();

  //   // Handle the deep link when the app is already open
  //   _appLinks.uriLinkStream.listen((Uri? uri) {
  //     if (uri != null) {
  //       _handleDeepLink(uri);
  //     }
  //   });

  //   // Check if the app was opened from a deep link when it was closed
  //   final Uri? initialUri = await _appLinks.getInitialLink();
  //   if (initialUri != null) {
  //     _handleDeepLink(initialUri);
  //   }
  // }

  // void _handleDeepLink(Uri uri) {
  //   if (uri.path == '/payment/success') {
  //   } else if (uri.path == '/payment/cancel') {
  //     _onPaymentCancel();
  //   }
  // }

  void _onPaymentSuccess(
    final String name,
    final String email,
  ) async {
    // Call the API to save the donation
    bool saved = await _saveDonation(
      name,
      email,
    );
    if (saved) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ThankYouPage(donationAmount: _donationAmount),
        ),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save donation. Please try again.')),
      );
    }
  }

  void _onPaymentCancel() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment was cancelled.')),
    );
  }

  Future<bool> _saveDonation(
    final String name,
    final String email,
  ) async {
    try {
      final response = await Dio().post(
        ApiUrl.DONATION,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: json.encode({
          'amount': _donationAmount,
          'name': name,
          "email": email,
          'reason': 'Donation',
          'reference': 'PayPal',
          'method': 'PayPal',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        print('Failed to save donation: ${response.data}');
        return false;
      }
    } catch (e) {
      print('Error saving donation: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  Img.get('new/bg_home.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                        SizedBox(),
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
              ),
              Positioned(
                top: 100,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(height: 40),
                        Text(
                          'Make a Donation',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Your generosity makes a difference',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 48),
                        Text(
                          '\$${_donationAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 24),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            ..._presetAmounts.map(
                              (amount) => _buildAmountButton(amount),
                            ),
                            _buildAmountButton(null),
                          ],
                        ),
                        SizedBox(height: 24),
                        if (_showCustomAmount)
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 3, 92, 164),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: _customAmountController,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: 'Enter custom amount',
                                labelStyle: TextStyle(color: Colors.white70),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.attach_money,
                                    color: Colors.white70),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _donationAmount =
                                      double.tryParse(value) ?? 0.0;
                                });
                              },
                            ),
                          ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton.icon(
            icon: Icon(Icons.paypal),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Donate with PayPal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 3, 92, 164),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () => _processPayment(context),
          ),
        ),
      ),
    );
  }

  Widget _buildAmountButton(double? amount) {
    final isSelected =
        amount == _donationAmount || (amount == null && _showCustomAmount);
    final buttonText =
        amount != null ? '\$${amount.toStringAsFixed(0)}' : 'Other';

    return ElevatedButton(
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor:
            isSelected ? Color(0xff0ebef4) : Color.fromARGB(255, 3, 92, 164),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () {
        setState(() {
          if (amount != null) {
            _donationAmount = amount;
            _showCustomAmount = false;
          } else {
            _showCustomAmount = true;
          }
        });
      },
    );
  }

  void _processPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
          sandboxMode: true,
          clientId:
              "AVscFoTe1xkQWPAy3w-tENcvPs_ePt-_jTGgXQtOcJJ7ZmS2e5GzvwIXTQTbZ4ovVDdfXHncfVfGqT69",
          secretKey:
              "ECCzZekSI-HA21mkcN2IDSY4SJnJ5tJLFCh8xRdGpyNxVuH3YbWCncA2PdQVKMSvsw8_-rRq2kZEQYPP",
          returnURL: "churchapp://payment/success",
          cancelURL: "churchapp://payment/cancel",
          transactions: [
            {
              "amount": {
                "total": _donationAmount.toStringAsFixed(2),
                "currency": "USD",
                "details": {
                  "subtotal": _donationAmount.toStringAsFixed(2),
                }
              },
              "description": "Donation to Our Cause",
            }
          ],
          note: "Contact us for any questions on your donation.",
          onSuccess: (Map paypalData) async {
            print("onSuccess: $paypalData");
            // Extract relevant information
            String name =
                "${paypalData['data']['payer']['payer_info']['first_name']} ${paypalData['data']['payer']['payer_info']['last_name']}";
            String email = paypalData['data']['payer']['payer_info']['email'];

            _onPaymentSuccess(name, email);
          },
          onError: (error) {
            print("onError: $error");
          },
          onCancel: (params) {
            print('cancelled: $params');
            //snackbar
          },
        ),
      ),
    );
  }
}
