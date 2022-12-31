import 'package:flutter/material.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/home/widgets/loading_widget.dart';
import 'package:movie99/models/cast.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({
    Key? key,
    required this.cast,
    this.showDetails = true,
  }) : super(key: key);

  final Cast cast;

  final bool showDetails;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        width: 200,
        height: 200,
        child: cast.image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radius + 10),
                child: Image.network(
                  'https://www.themoviedb.org/t/p/w220_and_h330_face${cast.image}',
                  fit: BoxFit.fill,
                ),
              )
            : const LoadingMovieWidget(),
      ),
      Text(
        cast.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        softWrap: false,
        style: AppStyle.bodyStyle,
      ),
      Text(
        cast.characterName,
        maxLines: 2,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: AppStyle.smallBodyStyle,
      ),
    ]);
  }
}
