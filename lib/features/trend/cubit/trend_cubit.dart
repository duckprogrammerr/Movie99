import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie99/features/home/repository/movies_repository.dart';
import 'package:movie99/models/movie.dart';

part 'trend_state.dart';

class TrendCubit extends Cubit<TrendState> {
  final MoviesRepostiory moviesRepostiory;
  TrendCubit(this.moviesRepostiory) : super(TrendInitial());

  List<Movie> _movies = [];

  Future<void> fetchMoviesList() async {
    try {
      _movies = await moviesRepostiory.getAllTrendList();
      emit(TrendSuccess(movies: _movies));
    } catch (_) {
      emit(TrendFailure());
    }
  }
}
