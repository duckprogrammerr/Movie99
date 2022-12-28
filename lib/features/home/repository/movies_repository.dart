import 'package:movie99/models/movie.dart';
import 'package:movie99/services/api_service.dart';
import 'package:movie99/services/shared_preferences_service.dart';

class MoviesRepostiory {
  final ApiService _apiService = ApiService();
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();
  // favorites
  addMovieToFavroites(Movie movie) async {
    List<String> favroites = await _sharedPreferencesService.getFavoriteList();
    favroites.add(movie.toString());
    _sharedPreferencesService.setFavoriteList(favroites);
  }

  removeMovieFromFavroites(Movie movie) async {
    List<String> favroites = await _sharedPreferencesService.getFavoriteList();
    favroites.removeWhere((e) => e == movie.toString());
    _sharedPreferencesService.setFavoriteList(favroites);
  }

  getAllNowPlayingList(int page) async {
    final List<Movie> nowPlayingList =
        await _apiService.getNowPlayingList(page.toString());
    return nowPlayingList;
  }

  getAllUpComingList(int page) async {
    final List<Movie> nowPlayingList =
        await _apiService.getUpComingList(page.toString());
    return nowPlayingList;
  }

  getAllTrendList() async {
    final List<Movie> nowPlayingList = await _apiService.getTrendingMovieList();
    return nowPlayingList;
  }

  getAllMoviesByGenre(int id, int page) async {
    final List<Movie> nowPlayingList =
        await _apiService.getMoviesByGenre(id, page.toString());
    return nowPlayingList;
  }
}
