import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/home/widgets/loading_widget.dart';
import 'package:movie99/features/movie_details/cubit/cast_cubit.dart';
import 'package:movie99/features/movie_details/movie_details_screen.dart';
import 'package:movie99/models/movie.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    Key? key,
    required this.movie,
    this.showDetails = true,
  }) : super(key: key);

  final Movie movie;

  final bool showDetails;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => CastCubit()..fetchCastList(movie.id),
                child: MovieDetailsScreen(
                  movie: movie,
                ),
              ),
            ));
      },
      child: Column(children: [
        SizedBox(
          width: 200,
          height: 240,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radius + 10),
            child: CachedNetworkImage(
              imageUrl:
                  'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.poster}',
              fit: BoxFit.fill,
              placeholder: (context, url) => const LoadingMovieWidget(),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        showDetails
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: AppStyle.bodyStyle,
                    ),
                  ),
                  RatingWidget(rating: movie.rating)
                ],
              )
            : Container()
      ]),
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppStyle.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        double.tryParse(rating)!.toStringAsFixed(1),
        style: AppStyle.smallBodyStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
