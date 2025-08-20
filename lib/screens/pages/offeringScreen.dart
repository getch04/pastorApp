import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferingScreen extends StatefulWidget {
  OfferingScreen({Key? key}) : super(key: key);
  static const routeName = "/OfferingScreen";

  @override
  _OfferingScreenState createState() => _OfferingScreenState();
}

class _OfferingScreenState extends State<OfferingScreen> {
  @override
  void initState() {
    super.initState();
    // Open the donation URL in default browser immediately when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openDonationInBrowser();
    });
  }

  Future<void> _openDonationInBrowser() async {
    final Uri donationUrl = Uri.parse("https://www.onewaymin.com/donation");

    try {
      if (await canLaunchUrl(donationUrl)) {
        await launchUrl(
          donationUrl,
          mode: LaunchMode.externalApplication, // Opens in default browser
        );
      } else {
        throw 'Could not launch donation URL';
      }
      // Navigate back after launching URL
      Navigator.of(context).pop();
    } catch (e) {
      print('Error opening donation URL: $e');
      // Show error message and navigate back
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to open donation page. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opening Donation Page...'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Redirecting to donation page...',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
