import 'package:flutter/material.dart';
import 'package:movie99/features/layout/layout_landing.dart';
import 'package:movie99/core/extensions/context_extension.dart';
import 'package:movie99/services/shared_preferences_service.dart';

class WalkThroughButton extends StatelessWidget {
  const WalkThroughButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(context.w * 0.7, 55),
      ),
      onPressed: () {
        SharedPreferencesService().setWalkThrough();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LayoutLanding()));
      },
      child: const Text(
        'Get Started',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
