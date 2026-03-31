part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSucess extends SearchState {
  final WeatherModel weather;
  const SearchSucess({required this.weather});

  @override
  List<Object> get props => [weather];
}

final class SearchFailure extends SearchState {
  final String errorMessage;
  const SearchFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
