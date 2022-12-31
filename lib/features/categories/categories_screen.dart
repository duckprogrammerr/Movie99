import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/categories/blocs/bloc/movies_by_genre_bloc.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_event.dart';
import 'package:movie99/features/movies/movies_scree.dart';
import 'package:movie99/models/genre.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(AppConstants.paddin),
                child: Text('Genres', style: AppStyle.headerStyle),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  padding: const EdgeInsets.all(20),
                  itemCount: genreMovieList.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                        child: Text(
                          genreMovieList[index].name,
                          textAlign: TextAlign.center,
                          style: AppStyle.bodyStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (context) => MoviesByGenreBloc()
                                  ..add(ChangeMovieGenre(
                                      genre: genreMovieList[index]))
                                  ..add(FetchMovieList()),
                                child: MoviesScreen(
                                  title: genreMovieList[index].name,
                                  useMoviesByGenreBloc: true,
                                ),
                              ),
                            ),
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
