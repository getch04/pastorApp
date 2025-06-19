import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentConfig {
  static const bool sandboxMode = false;

  static String get paypalClientId {
    return sandboxMode
        ? dotenv.get('PAYPAL_SANDBOX_CLIENT_ID')
        : dotenv.get('PAYPAL_LIVE_CLIENT_ID');
  }

  static String get paypalSecretKey {
    return sandboxMode
        ? dotenv.get('PAYPAL_SANDBOX_SECRET_KEY')
        : dotenv.get('PAYPAL_LIVE_SECRET_KEY');
  }
}
