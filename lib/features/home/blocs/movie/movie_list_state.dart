import 'package:equatable/equatable.dart';
import 'package:movie99/models/genre.dart';
import 'package:movie99/models/movie.dart';

enum MovieListStatus { initial, success, failure }

class MovieListState extends Equatable {
  const MovieListState({
    this.status = MovieListStatus.initial,
    this.movies = const <Movie>[],
    this.hasReachedMax = false,
    this.genre,
  });

  final List<Movie> movies;
  final MovieListStatus status;

  final Genre? genre;
  final bool hasReachedMax;
  MovieListState copyWith(
      {MovieListStatus? status,
      List<Movie>? movies,
      bool? hasReachedMax,
      Genre? genre}) {
    return MovieListState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      genre: genre ?? this.genre,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}
