import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => WeatherRemoteDataSource(sl()));

  sl.registerLazySingleton(() => WeatherRepository(remoteDataSource: sl()));
}
