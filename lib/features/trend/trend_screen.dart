import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/common_widgets/movie_list_grid_view.dart';
import 'package:movie99/features/trend/cubit/trend_cubit.dart';

class TrendScreen extends StatelessWidget {
  const TrendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(AppConstants.paddin - 10),
                child: Text('Trending', style: AppStyle.headerStyle),
              ),
              BlocBuilder<TrendCubit, TrendState>(builder: (context, state) {
                if (state is TrendSuccess) {
                  return MovieListGridView(movies: state.movies);
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
