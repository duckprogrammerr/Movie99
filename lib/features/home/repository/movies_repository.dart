import 'dart:convert';
import 'dart:developer';

import 'package:movie99/models/movie.dart';
import 'package:movie99/services/api_service.dart';
import 'package:movie99/services/shared_preferences_service.dart';

class MoviesRepostiory {
  final ApiService _apiService = ApiService();
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();
  // favorites
  Future<void> addMovieToFavorites(Movie movie) async {
    List<String> favorites = await _sharedPreferencesService.getFavoriteList();
    favorites.add(json.encode(movie.toString()));
    _sharedPreferencesService.setFavoriteList(favorites);
  }

  Future<void> removeMovieFromFavorites(Movie movie) async {
    List<String> favorites = await _sharedPreferencesService.getFavoriteList();
    favorites.removeWhere((e) => e == movie.toString());
    _sharedPreferencesService.setFavoriteList(favorites);
  }

  Future<List<Movie>> getAllFavoriteList() async {
    List<String> data = await _sharedPreferencesService.getFavoriteList();
    log(data.toString());
    List<Movie> favorites =
        data.map((e) => Movie.fromJson(json.decode(e))).toList();
    return favorites;
  }

  Future<List<Movie>> getAllNowPlayingList(int page) async {
    final List<Movie> nowPlayingList =
        await _apiService.getNowPlayingList(page.toString());
    return nowPlayingList;
  }

  Future<List<Movie>> getAllUpComingList(int page) async {
    final List<Movie> nowPlayingList =
        await _apiService.getUpComingList(page.toString());
    return nowPlayingList;
  }

  Future<List<Movie>> getAllTrendList() async {
    final List<Movie> nowPlayingList = await _apiService.getTrendingMovieList();
    return nowPlayingList;
  }

  Future<List<Movie>> getAllMoviesByGenre(int id, int page) async {
    final List<Movie> nowPlayingList =
        await _apiService.getMoviesByGenre(id, page.toString());
    return nowPlayingList;
  }
}
