import 'package:equatable/equatable.dart';
import 'package:movie99/models/movie.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteList extends FavoriteEvent {}

class AddMovieToFavorite extends FavoriteEvent {
  final Movie movie;
  const AddMovieToFavorite({required this.movie});
}

class RemoveMovieFromFavorite extends FavoriteEvent {
  final Movie movie;
  const RemoveMovieFromFavorite({required this.movie});
}
