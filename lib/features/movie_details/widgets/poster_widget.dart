import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/extensions/context_extension.dart';

import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/favorites/bloc/favorite_bloc.dart';
import 'package:movie99/features/favorites/bloc/favorite_event.dart';
import 'package:movie99/models/movie.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(60)),
            child: Image.network(
              'https://image.tmdb.org/t/p/original${movie.poster}',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddin - 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppStyle.backgroundColor,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      iconSize: 25,
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (context
                          .read<FavoriteBloc>()
                          .favorites
                          .contains(movie)) {
                        return context
                            .read<FavoriteBloc>()
                            .add(RemoveMovieFromFavorite(movie: movie));
                      }
                      context
                          .read<FavoriteBloc>()
                          .add(AddMovieToFavorite(movie: movie));
                    },
                    icon: Icon(
                      context.watch<FavoriteBloc>().favorites.contains(movie)
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: AppStyle.redColor,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
