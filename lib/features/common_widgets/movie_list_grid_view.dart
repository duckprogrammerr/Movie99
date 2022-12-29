import 'package:flutter/material.dart';
import 'package:movie99/features/common_widgets/moive_widget.dart';
import 'package:movie99/models/movie.dart';

class MovieListGridView extends StatelessWidget {
  final List<Movie> movies;
  const MovieListGridView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieWidget(movie: movies[index]),
    );
  }
}
