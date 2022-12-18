import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie99/models/cast.dart';
import 'package:movie99/models/movie.dart';

class ApiService {
  static const _apiToken = '6a5bf2e11e078ec2d1776a320988c9da';
  static const _baseUrl = 'api.themoviedb.org';
  Future<List<Movie>> getNowPlayingList({String? page = '1'}) async {
    final url = Uri(
        scheme: 'https',
        host: _baseUrl,
        path: '/3/movie/now_playing',
        queryParameters: {
          'api_key': _apiToken,
          'page': page,
        });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'];
      List<Movie> movies = moviesFromJsonToList(data);
      print(movies);
      return movies;
    } else {
      throw 'Error';
    }
  }

  Future<List<Movie>> getUpComingList({String? page = '1'}) async {
    final url = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/3/movie/upcoming',
      queryParameters: {
        'api_key': _apiToken,
        'page': page,
      },
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'];

      List<Movie> movies = moviesFromJsonToList(data);
      return movies;
    } else {
      throw 'Error';
    }
  }

  Future<List<Movie>> getTrendingMovieList({String? page = '1'}) async {
    final url = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/3/trending/movie/day',
      queryParameters: {
        'api_key': _apiToken,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'];
      List<Movie> movies = moviesFromJsonToList(data);

      return movies;
    } else {
      throw 'Error';
    }
  }

  Future getMoviesByGenre(int id, {String? page = '1'}) async {
    final url = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/3/discover/movie',
      queryParameters: {
        'api_key': _apiToken,
        'include_video': 'false',
        'page': page,
        'with_genres': '$id',
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'];

      List<Movie> movies = moviesFromJsonToList(data);
      return movies;
    } else {
      throw 'Error';
    }
  }

  Future<List<Cast>> getMovieCast(int id) async {
    final url = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '/3/movie/$id/credits',
      queryParameters: {
        'api_key': _apiToken,
      },
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['cast'];
      List<Cast> cast = castMembersToList(data);
      log(response.reasonPhrase!);
      return cast;
    } else {
      return throw response.reasonPhrase!;
    }
  }
}
