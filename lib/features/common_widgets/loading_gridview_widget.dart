import 'package:flutter/material.dart';
import 'package:movie99/features/home/widgets/loading_widget.dart';

class LoadingGridViewWidget extends StatelessWidget {
  const LoadingGridViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.45,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 5,
      itemBuilder: (context, index) => const LoadingMovieWidget(),
    );
  }
}
