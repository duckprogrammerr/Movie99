import 'package:flutter/material.dart';
import 'package:movie99/core/theme/app_style.dart';
import 'package:movie99/features/intro/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie99',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.darkTheme(),
      home: const IntroScreen(),
    );
  }
}
