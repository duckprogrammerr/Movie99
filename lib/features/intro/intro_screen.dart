import 'package:flutter/material.dart';
import 'package:movie99/core/constants/constants.dart';
import 'package:movie99/core/extensions/context_extension.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/intro/widgets/scrolling_listview.dart';
import 'package:movie99/services/api_service.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService().getMoviesByGenre(28, page: '2');
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: -10,
          child: Transform.rotate(
            angle: -0.08,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Row(mainAxisSize: MainAxisSize.min, children: const [
                ScrollingListView(
                  duration: 20,
                  starterIndex: 0,
                ),
                SizedBox(
                  width: 10,
                ),
                ScrollingListView(
                  duration: 30,
                  reverse: true,
                  starterIndex: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                ScrollingListView(
                  duration: 40,
                  starterIndex: 10,
                ),
                SizedBox(
                  width: 10,
                ),
              ]),
            ),
          ),
        ),
        const _Body()
      ]),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: context.w,
        height: context.h * 0.4,
        padding: const EdgeInsets.all(Constants.paddin),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(context.w * 0.7, 55),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
