import 'package:flutter/material.dart';
import 'package:movie99/features/common_widgets/cast_widget.dart';
import 'package:movie99/models/cast.dart';

class CastGridView extends StatelessWidget {
  const CastGridView({
    Key? key,
    required this.casts,
  }) : super(key: key);
  final List<Cast> casts;
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
      itemCount: casts.length,
      itemBuilder: (context, index) => CastWidget(cast: casts[index]),
    );
  }
}
