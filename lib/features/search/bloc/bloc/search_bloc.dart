import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_project_app/data/models/weather_model.dart';
import 'package:weather_project_app/data/repositories/weather_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WeatherRepository repository;
  SearchBloc(this.repository) : super(SearchInitial()) {
    on<OnSearchSubmitted>((event, emit) async {
      emit(SearchLoading());
      try {
        final weather = await repository.getWeatherData(event.cityName);
        emit(SearchSucess(weather: weather));
      } catch (e) {
        emit(
          SearchFailure(
            errorMessage: "Erro ao buscar cidade/clima. Tente novamente: $e",
          ),
        );
      }
    });
  }
}
