import 'package:equatable/equatable.dart';
import 'package:movie99/models/genre.dart';

List<Movie> moviesFromJsonToList(List data) =>
    data.map((e) => Movie.fromJson(e)).toList();
//
List<Genre> searchForGenres(List<dynamic> genreIds) => genreIds.map((e) {
      return genreMovieList.firstWhere((element) => element.id == e);
    }).toList();

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String poster;
  final String rating;
  final String reviewsCount;
  final List<Genre> genres;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster,
    required this.rating,
    required this.reviewsCount,
    required this.genres,
  });
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        poster: json['poster_path'],
        rating: json['vote_average'].toString(),
        reviewsCount: json['vote_count'].toString(),
        genres: searchForGenres(json['genre_ids']),
      );
  @override
  String toString() => {
        'id': id,
        'title': title,
        'overview': overview,
        'poster_path': poster,
        'vote_average': rating,
        'vote_count': reviewsCount,
        'genre_ids': genres,
      }.toString();

  @override
  List<Object?> get props => [id, title];
}
