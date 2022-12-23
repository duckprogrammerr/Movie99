import 'package:flutter/material.dart';
import 'package:movie99/core/constants/app_constants.dart';
import 'package:movie99/core/extensions/context_extension.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/walk_through/widgets/background.dart';
import 'package:movie99/features/walk_through/widgets/walk_through_button.dart';

class WalkThroughScreen extends StatelessWidget {
  const WalkThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // background

        const Background(),
        Positioned(
          bottom: 0,
          child: Container(
            width: context.w,
            height: context.h * 0.4,
            // alignment: Alignment.b,
            padding: const EdgeInsets.all(AppConstants.paddin),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: AppStyle.blackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Movie99',
                  style: AppStyle.headerStyle.copyWith(fontSize: 40),
                ),
                Text(
                  'Watch Movies in Movie99 app',
                  style: AppStyle.smallBodyStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                const WalkThroughButton()
              ],
            ),
          ),
        )
      ]),
    );
  }
}
