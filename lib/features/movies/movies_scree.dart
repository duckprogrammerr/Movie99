import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/categories/blocs/bloc/movies_by_genre_bloc.dart';

import 'package:movie99/features/common_widgets/movie_list_grid_view.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_event.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_state.dart';
import 'package:movie99/features/home/blocs/movie/now_playing_bloc.dart';
import 'package:movie99/features/home/blocs/movie/upcoming_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    super.key,
    required this.title,
    this.useMoviesByGenreBloc = false,
    this.useNowPlayingMoviesBloc = false,
    this.useUpcomingMoviesBloc = false,
  });

  final String title;
  final bool useMoviesByGenreBloc;
  final bool useNowPlayingMoviesBloc;
  final bool useUpcomingMoviesBloc;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    controller.addListener(_onScroll);
    super.initState();
  }

  _onScroll() {
    if (_isBottom) {
      if (widget.useMoviesByGenreBloc) {
        context.read<MoviesByGenreBloc>().add(FetchMovieList());
      }
      if (widget.useNowPlayingMoviesBloc) {
        context.read<NowPlayingMoviesBloc>().add(FetchMovieList());
      }
      if (widget.useUpcomingMoviesBloc) {
        context.read<UpcomingMoviesBloc>().add(FetchMovieList());
      }
    }
  }

  bool get _isBottom {
    double maxScroll = controller.position.maxScrollExtent;
    double currentPosition = controller.offset;
    return currentPosition == maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: AppStyle.titleStyle),
        backgroundColor: AppStyle.backgroundColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // screen title

              if (widget.useMoviesByGenreBloc)
                BlocBuilder<MoviesByGenreBloc, MovieListState>(
                  builder: (context, state) {
                    return MovieListGridView(movies: state.movies);
                  },
                ),
              if (widget.useNowPlayingMoviesBloc)
                BlocBuilder<NowPlayingMoviesBloc, MovieListState>(
                  builder: (context, state) {
                    return MovieListGridView(movies: state.movies);
                  },
                ),
              if (widget.useUpcomingMoviesBloc)
                BlocBuilder<UpcomingMoviesBloc, MovieListState>(
                  builder: (context, state) {
                    return MovieListGridView(movies: state.movies);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
