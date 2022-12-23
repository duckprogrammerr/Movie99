part of 'trend_cubit.dart';

abstract class TrendState extends Equatable {
  const TrendState();

  @override
  List<Object> get props => [];
}

class TrendInitial extends TrendState {}

class TrendSuccess extends TrendState {
  final List<Movie> movies;
  const TrendSuccess({required this.movies});
}

class TrendFailure extends TrendState {}
