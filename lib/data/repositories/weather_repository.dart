import '../models/weather_model.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepository({required this.remoteDataSource});

  Future<WeatherModel> getWeatherData(String cityName) async {
    try {
      final cityData = await remoteDataSource.getCityLocation(cityName);
      final String locationKey = cityData['Key'];
      final String localizedName = cityData['LocalizedName'];

      final weatherJson = await remoteDataSource.getCurrentWeather(locationKey);

      return WeatherModel.fromJson(weatherJson, localizedName);
    } catch (e) {
      rethrow;
    }
  }
}
