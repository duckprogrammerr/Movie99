import 'package:flutter/material.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/extensions/context_extension.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/common_widgets/cast_widget.dart';
import 'package:movie99/models/cast.dart';
import 'package:movie99/models/movie.dart';
import 'package:movie99/services/api_service.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late List<Cast> casts;
  @override
  void initState() {
    getCast();
    super.initState();
  }

  getCast() async {
    casts = await ApiService().getMovieCast(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(60)),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original${widget.movie.poster}',
                        fit: BoxFit.fill,
                        //     loadingBuilder: (context, child, loadingProgress) {
                        //   if (loadingProgress != null) {
                        //     print(loadingProgress.cumulativeBytesLoaded);
                        //     return CircuProgressIndicator(
                        //       value: loadingProgress.cumulativeBytesLoaded /
                        //           loadingProgress.expectedTotalBytes!,
                        //     );
                        //   }
                        //   return child;
                        // }
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
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  iconSize: 25,
                                  icon: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Colors.white,
                                  ),
                                )),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border_rounded,
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
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppStyle.primaryColor,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  double.tryParse(widget.movie.rating)!
                                      .toStringAsFixed(1),
                                  style: AppStyle.smallBodyStyle
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${widget.movie.reviewsCount} \nreviews",
                                textAlign: TextAlign.center,
                                style: AppStyle.smallBodyStyle
                                    .copyWith(fontSize: 13),
                              )
                            ],
                          )
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        itemCount: widget.movie.genres.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: const Color(0xff191a21),
                                borderRadius:
                                    BorderRadius.circular(AppConstants.radius)),
                            child: Center(
                              child: Text(
                                widget.movie.genres[index].name,
                                style: AppStyle.smallBodyStyle,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.movie.overview,
                      style: AppStyle.smallBodyStyle,
                    ),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.45,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: casts.length,
                itemBuilder: (context, index) => CastWidget(cast: casts[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
