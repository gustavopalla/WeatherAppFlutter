import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';

class WeatherRemoteDataSource {
  final Dio _dio;

  WeatherRemoteDataSource(this._dio);

  Future<Map<String, dynamic>> getCityLocation(String cityName) async {
    try {
      final response = await _dio.get(
        ApiConstants.baseUrl + ApiConstants.citySearch,
        queryParameters: {
          'apikey': ApiConstants.apiKey,
          'q': cityName,
          'language': 'pt-br',
        },
      );
      if (response.data.isNotEmpty) {
        return response.data[0];
      }
      throw Exception('Cidade não encontrada');
    } catch (e) {
      throw Exception('Erro ao buscar cidade/localização: $e');
    }
  }

  Future<Map<String, dynamic>> getCurrentWeather(String locationKey) async {
    try {
      final response = await _dio.get(
        "${ApiConstants.baseUrl}${ApiConstants.currentCondition}$locationKey",
        queryParameters: {
          'apikey': ApiConstants.apiKey,
          'language': 'pt-br',
          'details': 'true',
        },
      );
      return response.data[0];
    } catch (e) {
      throw Exception('Erro ao buscar clima: $e');
    }
  }
}
