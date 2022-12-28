import 'package:bloc/bloc.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_event.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_state.dart';

import 'package:movie99/features/home/repository/movies_repository.dart';
import 'package:movie99/models/movie.dart';

class UpcomingMoviesBloc extends Bloc<MovieListEvent, MovieListState> {
  MoviesRepostiory moviesRepostiory = MoviesRepostiory();
  int page = 1;

  UpcomingMoviesBloc() : super(const MovieListState()) {
    on<FetchMovieList>(_fetchMoviesList);
  }

  Future<void> _fetchMoviesList(
      FetchMovieList event, Emitter<MovieListState> emit) async {
    if (state.hasReachedMax) return;
    try {
      // if the status is "initial" then add all movies and make status success

      if (state.status == MovieListStatus.initial) {
        final List<Movie> movies =
            await moviesRepostiory.getAllUpComingList(page);
        page++;
        emit(state.copyWith(
          status: MovieListStatus.success,
          movies: movies,
          hasReachedMax: false,
        ));
      }
      //
      final List<Movie> movies =
          await moviesRepostiory.getAllUpComingList(page);
      page++;

      movies.isEmpty
          ? emit(state.copyWith(
              hasReachedMax: true,
            ))
          : emit(state.copyWith(
              status: MovieListStatus.success,
              movies: List.of(state.movies)..addAll(movies),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: MovieListStatus.failure));
    }
  }
}
