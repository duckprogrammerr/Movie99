import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_event.dart';
import 'package:movie99/features/home/blocs/movie/now_playing_bloc.dart';
import 'package:movie99/features/home/blocs/movie/upcoming_bloc.dart';
import 'package:movie99/features/home/repository/movies_repository.dart';
import 'package:movie99/features/trend/cubit/trend_cubit.dart';
import 'package:movie99/features/walk_through/walk_through_screen.dart';
import 'package:movie99/features/layout/cubit/layout_cubit.dart';

void main() {
  Bloc.observer = BBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
            create: (context) => NowPlayingMoviesBloc()..add(FetchMovieList())),
        BlocProvider(
            create: (context) => UpcomingMoviesBloc()..add(FetchMovieList())),
        BlocProvider(
          create: (context) => TrendCubit()..fetchMoviesList(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie99',
        debugShowCheckedModeBanner: false,
        theme: AppStyle.darkTheme(),
        home: const WalkThroughScreen(),
      ),
    );
  }
}

class BBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
