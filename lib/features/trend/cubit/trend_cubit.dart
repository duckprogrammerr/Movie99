import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie99/features/home/repository/movies_repository.dart';
import 'package:movie99/models/movie.dart';

part 'trend_state.dart';

class TrendCubit extends Cubit<TrendState> {
  final MoviesRepostiory moviesRepostiory = MoviesRepostiory();
  TrendCubit() : super(TrendInitial());

  Future<void> fetchMoviesList() async {
    try {
      List<Movie> movies = await moviesRepostiory.getAllTrendList();
      emit(TrendSuccess(movies: movies));
    } catch (_) {
      emit(TrendFailure());
    }
  }
}
