import 'package:movie99/models/genre.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String poster;
  final double rating;
  final int reviewsCount;
  final List<Genre> genres;

  Movie({
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
        rating: json['vote_average'],
        reviewsCount: json['vote_count'],
        genres: json['genre_ids']
            .map((int id) =>
                genreMovieList.firstWhere((element) => element.id == id))
            .toList(),
      );
}
