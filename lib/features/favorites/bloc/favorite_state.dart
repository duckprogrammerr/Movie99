import 'package:movie99/models/movie.dart';

abstract class FavoriteState {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Movie> movies;
  FavoriteLoaded(this.movies);
}

class FavoriteNoData extends FavoriteState {}
