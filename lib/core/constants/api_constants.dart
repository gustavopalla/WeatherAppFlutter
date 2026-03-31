import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey => dotenv.env['ACCUWEATHER_API_KEY'] ?? '';
  static String get baseUrl => dotenv.env['ACCUWEATHER_BASE_URL'] ?? '';

  static const String citySearch = "/locations/v1/cities/search";
  static const String currentCondition = "/currentconditions/v1/";
  static const String dailyForecast = "/forecasts/v1/daily/5day/";
}
