import 'package:flutter_dotenv/flutter_dotenv.dart';

class Stringer{
  static String get API_URL {
    String apiUrl = dotenv.get("API_URL");

    return apiUrl;
  }
}