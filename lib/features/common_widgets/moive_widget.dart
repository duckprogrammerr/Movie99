import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
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
    return Column(children: [
      SizedBox(
        width: 200,
        height: 240,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radius + 10),
          child: CachedNetworkImage(
            imageUrl:
                'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.poster}',
            placeholder: (context, url) => ShaderMask(
              blendMode: BlendMode.color,
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFFEBEBF4),
                    Color(0xFFF4F4F4),
                    Color(0xFFEBEBF4),
                  ],
                  stops: [
                    0.1,
                    0.3,
                    0.4,
                  ],
                  begin: Alignment(-1.0, -0.3),
                  end: Alignment(1.0, 0.3),
                  tileMode: TileMode.clamp,
                ).createShader(bounds);
              },
              child:
                  // ignore: sized_box_for_whitespace
                  Container(width: 200, height: 240),
            ),
            fit: BoxFit.fill,
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppStyle.primaryColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    double.tryParse(movie.rating)!.toStringAsFixed(1),
                    style:
                        AppStyle.smallBodyStyle.copyWith(color: Colors.white),
                  ),
                )
              ],
            )
          : Container()
    ]);
  }
}
