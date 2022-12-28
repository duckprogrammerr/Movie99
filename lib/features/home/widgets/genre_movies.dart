import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/categories/blocs/bloc/movies_by_genre_bloc.dart';
import 'package:movie99/features/common_widgets/movie_list_grid_view.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_event.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_state.dart';
import 'package:movie99/models/genre.dart';

class GenreMoviesSection extends StatelessWidget {
  const GenreMoviesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoviesByGenreBloc()
          ..add(ChangeMovieGenre(genre: genreMovieList[0]))
          ..add(FetchMovieList()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppConstants.paddin - 10),
              child: Text(
                'Movies',
                style: AppStyle.titleStyle,
                textAlign: TextAlign.left,
              ),
            ),
            const GenreListViewWidget(),
            BlocBuilder<MoviesByGenreBloc, MovieListState>(
                builder: (context, state) {
              return MovieListGridView(
                movies: state.movies,
              );
            })
          ],
        ));
  }
}

class GenreListViewWidget extends StatelessWidget {
  const GenreListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesByGenreBloc, MovieListState>(
      builder: (context, state) {
        return SizedBox(
          height: 60,
          child: ListView.builder(
            itemCount: genreMovieList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (state.genre!.id == genreMovieList[index].id) {
                      return;
                    }

                    context
                        .read<MoviesByGenreBloc>()
                        .add(ChangeMovieGenre(genre: genreMovieList[index]));
                    context.read<MoviesByGenreBloc>().add(FetchMovieList());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.genre!.id == genreMovieList[index].id
                        ? AppStyle.primaryColor
                        : const Color(0xff191A21),
                  ),
                  child: Text(
                    genreMovieList[index].name,
                    style: AppStyle.bodyStyle,
                  )),
            ),
          ),
        );
      },
    );
  }
}
