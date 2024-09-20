import 'package:flutter_dotenv/flutter_dotenv.dart';

String BIBLE_API_KEY = dotenv.get('BIBLE-API-KEY', fallback: '');
String BIBLE_BASE_URL = 'https://4.dbt.io/api';
