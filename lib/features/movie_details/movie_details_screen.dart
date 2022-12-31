import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/common_widgets/loading_gridview_widget.dart';
import 'package:movie99/features/common_widgets/moive_widget.dart';
import 'package:movie99/features/movie_details/cubit/cast_cubit.dart';
import 'package:movie99/features/movie_details/widgets/cast_gridview.dart';
import 'package:movie99/features/movie_details/widgets/poster_widget.dart';
import 'package:movie99/models/movie.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PosterWidget(
                movie: widget.movie,
              ),
              Padding(
                padding: const EdgeInsets.all(AppConstants.paddin),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.movie.title,
                              maxLines: 3,
                              style: AppStyle.titleStyle,
                            ),
                          ),
                          // ratings
                          Column(
                            children: [
                              RatingWidget(rating: widget.movie.rating),
                              const SizedBox(height: 5),
                              Text(
                                "${widget.movie.reviewsCount} \nreviews",
                                textAlign: TextAlign.center,
                                style: AppStyle.smallBodyStyle
                                    .copyWith(fontSize: 13),
                              )
                            ],
                          )
                        ]),
                    const SizedBox(height: AppConstants.paddin),

                    // movie genres
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        itemCount: widget.movie.genres.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            _GenreItem(name: widget.movie.genres[index].name),
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddin),
                    Text(
                      widget.movie.overview,
                      style: AppStyle.smallBodyStyle,
                    ),
                  ],
                ),
              ),
              // cast
              BlocBuilder<CastCubit, CastState>(builder: (context, state) {
                if (state is CastLoaded) {
                  return CastGridView(
                    casts: state.casts,
                  );
                }
                return const LoadingGridViewWidget();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenreItem extends StatelessWidget {
  const _GenreItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xff191a21),
        borderRadius: BorderRadius.circular(AppConstants.radius),
      ),
      child: Center(
        child: Text(
          name,
          style: AppStyle.smallBodyStyle,
        ),
      ),
    );
  }
}
