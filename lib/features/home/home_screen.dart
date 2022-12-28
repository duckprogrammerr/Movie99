import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/home/blocs/movie/movie_list_state.dart';
import 'package:movie99/features/home/blocs/movie/now_playing_bloc.dart';
import 'package:movie99/features/home/blocs/movie/upcoming_bloc.dart';
import 'package:movie99/features/home/blocs/pageview_cubit.dart';
import 'package:movie99/features/home/widgets/genre_movies.dart';
import 'package:movie99/features/home/widgets/loading_widget.dart';
import 'package:movie99/features/home/widgets/movie_pageview.dart';
import 'package:movie99/features/movies/movies_scree.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: AppConstants.paddin),
          child: Column(children: [
            TitleWidget(
              title: 'Now Playing',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MoviesScreen(
                    title: 'Now Playing',
                    useNowPlayingMoviesBloc: true,
                  ),
                ),
              ),
            ),
            BlocBuilder<NowPlayingMoviesBloc, MovieListState>(
              builder: (context, state) {
                return AnimatedCrossFade(
                  secondChild: BlocProvider(
                    create: (context) => PageViewCubit(),
                    child: MoviePageView(movies: state.movies),
                  ),
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: state.movies.isEmpty
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: SizedBox(
                    height: 250,
                    child: PageView.builder(
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: PageController(
                          viewportFraction: 0.50, initialPage: 1),
                      itemBuilder: (context, index) => Transform.scale(
                          scale: index == 1 ? 1 : 0.9,
                          child: const LoadingMovieWidget()),
                    ),
                  ),
                );
              },
            ),
            TitleWidget(
              title: 'Upcoming',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MoviesScreen(
                    title: 'Upcoming',
                    useUpcomingMoviesBloc: true,
                  ),
                ),
              ),
            ),
            BlocBuilder<UpcomingMoviesBloc, MovieListState>(
              builder: (context, state) {
                return AnimatedCrossFade(
                  secondChild: BlocProvider(
                    create: (context) => PageViewCubit(),
                    child: MoviePageView(
                      movies: state.movies,
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: state.movies.isEmpty
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: SizedBox(
                    height: 250,
                    child: PageView.builder(
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: PageController(
                          viewportFraction: 0.50, initialPage: 1),
                      itemBuilder: (context, index) => Transform.scale(
                          scale: index == 1 ? 1 : 0.9,
                          child: const LoadingMovieWidget()),
                    ),
                  ),
                );
              },
            ),
            const GenreMoviesSection(),
          ]),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddin - 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyle.titleStyle),
          InkWell(
            onTap: onTap,
            child: Text(
              'See All',
              style: AppStyle.smallBodyStyle
                  .copyWith(color: AppStyle.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
