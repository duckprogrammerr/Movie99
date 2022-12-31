import 'package:flutter/material.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/layout/layout_landing.dart';
import 'package:movie99/features/walk_through/walk_through_screen.dart';
import 'package:movie99/services/shared_preferences_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.sync(() async {
      if (await SharedPreferencesService().getWalkThrough()) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LayoutLanding()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WalkThroughScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Text(
                'Movie99',
                style: AppStyle.headerStyle.copyWith(fontSize: 30),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: LinearProgressIndicator(
                backgroundColor: AppStyle.primaryColor.withOpacity(0.2),
                color: AppStyle.primaryColor,
              ),
            ),
          ]),
    );
  }
}
