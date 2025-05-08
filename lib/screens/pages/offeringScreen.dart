import 'dart:convert';
import 'dart:developer';

import 'package:churchapp_flutter/config/payment_config.dart';
import 'package:churchapp_flutter/screens/DrawerScreen.dart';
import 'package:churchapp_flutter/screens/pages/thankYouPage.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:churchapp_flutter/utils/img.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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

  final TextEditingController _customAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _customAmountController.text = _donationAmount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void _onPaymentSuccess(
    final String name,
    final String email,
    final String amount,
  ) async {
    // Call the API to save the donation
    bool saved = await _saveDonation(
      name,
      email,
      amount,
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
    final String amount,
  ) async {
    try {
      final response = await Dio().post(
        ApiUrl.DONATION,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: json.encode({
          'data': {
            'amount': amount,
            'name': name,
            'email': email,
            'reason': 'Donation',
            'reference': 'PayPal',
            'method': 'PayPal',
          }
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Color(0xFF1E3F6F)),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        title: Image.asset(
          Img.get('new/Logo.png'),
          height: 40,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                'Make a Difference',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3F6F),
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Your generosity helps us serve our community better',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FF),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '\$${_donationAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3F6F),
                      ),
                    ),
                    SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        ..._presetAmounts
                            .map((amount) => _buildAmountButton(amount)),
                        _buildAmountButton(null),
                      ],
                    ),
                  ],
                ),
              ),
              if (_showCustomAmount) ...[
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: Color(0xFF1E3F6F).withOpacity(0.2)),
                  ),
                  child: TextField(
                    controller: _customAmountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(fontSize: 18, color: Color(0xFF1E3F6F)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter amount',
                      prefixIcon:
                          Icon(Icons.attach_money, color: Color(0xFF1E3F6F)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _donationAmount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => _processPayment(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E3F6F),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.paypal, size: 24, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'Donate Securely',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                '100% Secure Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountButton(double? amount) {
    final isSelected =
        amount == _donationAmount || (amount == null && _showCustomAmount);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if (amount != null) {
              _donationAmount = amount;
              _showCustomAmount = false;
            } else {
              _showCustomAmount = true;
            }
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1E3F6F) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? Color(0xFF1E3F6F)
                  : Color(0xFF1E3F6F).withOpacity(0.2),
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Color(0xFF1E3F6F).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : null,
          ),
          child: Text(
            amount != null ? '\$${amount.toStringAsFixed(0)}' : 'Custom',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Color(0xFF1E3F6F),
            ),
          ),
        ),
      ),
    );
  }

  void _processPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: PaymentConfig.sandboxMode,
          clientId: PaymentConfig.paypalClientId,
          secretKey: PaymentConfig.paypalSecretKey,
          transactions: [
            {
              "amount": {
                "total": _donationAmount.toStringAsFixed(2),
                "currency": "USD",
                "details": {
                  "subtotal": _donationAmount.toStringAsFixed(2),
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description": "Church Donation",
              "item_list": {
                "items": [
                  {
                    "name": "Church Donation",
                    "quantity": 1,
                    "price": _donationAmount.toStringAsFixed(2),
                    "currency": "USD"
                  }
                ]
              }
            }
          ],
          note: "Contact us for any questions on your donation.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            try {
              // Extract payer info from the data structure
              final data = params['data'];
              final payerInfo = data['payer']['payer_info'];
              String name =
                  "${payerInfo['first_name']} ${payerInfo['last_name']}";
              String email = payerInfo['email'];

              // You might want to store additional information
              final transactionId = data['id'];
              final amount = data['transactions'][0]['amount']['total'];
              final status = data['state'];

              _onPaymentSuccess(name, email, amount);
            } catch (e) {
              print('PayPal data processing error: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Error processing payment data. Please contact support.'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Payment failed: ${error.toString()}'),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Payment was cancelled'),
                backgroundColor: Colors.orange,
              ),
            );
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
