import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_event.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_state.dart';
import 'package:movie99/features/home/repository/movies_repository.dart';
import 'package:movie99/models/movie.dart';

class MoviesByGenreBloc extends Bloc<MovieListEvent, MovieListState> {
  int page = 1;
  MoviesRepostiory moviesRepostiory = MoviesRepostiory();
  MoviesByGenreBloc() : super(const MovieListState()) {
    on<FetchMovieList>(
      _fetchMoviesList,
    );
    on<ChangeMovieGenre>(_changeGenre);
  }
  void _changeGenre(ChangeMovieGenre event, Emitter<MovieListState> emit) {
    page = 1;
    emit(MovieListState(genre: event.genre));
  }

  Future<void> _fetchMoviesList(
      FetchMovieList event, Emitter<MovieListState> emit) async {
    // if you'ev reached max page do need to request for movies again ?? :)
    if (state.hasReachedMax) return;

    try {
      // if the status is "initial" then add all movies and make status success
      // and if event genre and state genre not equal then change genre and ...
      // requst movies
      log(page.toString());
      if (state.status == MovieListStatus.initial) {
        final List<Movie> movies =
            await moviesRepostiory.getAllMoviesByGenre(state.genre!.id, page);

        page++;
        return emit(state.copyWith(
            hasReachedMax: false,
            status: MovieListStatus.success,
            movies: movies));
      }
      // if the status not initial then increase page and request for movies

      final List<Movie> movies =
          await moviesRepostiory.getAllMoviesByGenre(state.genre!.id, page);
      page++;

      movies.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: MovieListStatus.success,
                movies: List.of(state.movies)..addAll(movies),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: MovieListStatus.failure));
    }
  }
}
