import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/features/common_widgets/moive_widget.dart';
import 'package:movie99/features/home/blocs/pageview_cubit.dart';
import 'package:movie99/models/movie.dart';

class MoviePageView extends StatelessWidget {
  final List<Movie> movies;

  const MoviePageView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      viewportFraction: 0.50,
      initialPage: 1,
    );
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: BlocBuilder<PageViewCubit, int>(
            builder: (context, state) {
              return PageView.builder(
                controller: pageController,
                onPageChanged: (value) =>
                    context.read<PageViewCubit>().changePage(value),
                itemCount: movies.length,
                itemBuilder: (context, index) => AnimatedScale(
                  duration: const Duration(milliseconds: 400),
                  scale: state == index ? 1 : 0.9,
                  child: MovieWidget(
                    movie: movies[index],
                    showDetails: state == index ? true : false,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
