import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/common_widgets/movie_list_grid_view.dart';

import 'bloc/favorite_bloc.dart';
import 'bloc/favorite_state.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // screen title
              const Padding(
                padding: EdgeInsets.all(AppConstants.paddin - 10),
                child: Text('Favorites', style: AppStyle.headerStyle),
              ),

              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoaded) {
                    return MovieListGridView(movies: state.movies);
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'No Favorites',
                      textAlign: TextAlign.center,
                      style: AppStyle.smallBodyStyle.copyWith(fontSize: 20),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
