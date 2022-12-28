import 'package:equatable/equatable.dart';
import 'package:movie99/models/genre.dart';

abstract class MovieListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMovieList extends MovieListEvent {}

class ChangeMovieGenre extends MovieListEvent {
  final Genre genre;
  ChangeMovieGenre({required this.genre});
}
