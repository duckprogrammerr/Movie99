import 'package:bloc/bloc.dart';
import 'favorite_state.dart';
import 'favorite_event.dart';
import 'package:movie99/features/home/repository/movies_repository.dart';
import 'package:movie99/models/movie.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  MoviesRepostiory moviesRepostiory = MoviesRepostiory();
  List<Movie> favorites = [];
  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavoriteList>(_loadFavoriteList);
    on<AddMovieToFavorite>(_addFavoriteToList);
    on<RemoveMovieFromFavorite>(_removeFavoriteToList);
  }
  Future<void> _loadFavoriteList(
      LoadFavoriteList event, Emitter<FavoriteState> emit) async {
    favorites = await moviesRepostiory.getAllFavoriteList();
    if (favorites.isEmpty) {
      return emit(FavoriteNoData());
    }
    return emit(FavoriteLoaded(favorites));
  }

  void _addFavoriteToList(
      AddMovieToFavorite event, Emitter<FavoriteState> emit) {
    moviesRepostiory.addMovieToFavorites(event.movie);

    favorites.add(event.movie);
    return emit(FavoriteLoaded(favorites));
  }

  void _removeFavoriteToList(
      RemoveMovieFromFavorite event, Emitter<FavoriteState> emit) {
    moviesRepostiory.removeMovieFromFavorites(event.movie);
    favorites.remove(event.movie);
    if (favorites.isEmpty) return emit(FavoriteNoData());
    return emit(FavoriteLoaded(favorites));
  }
}
