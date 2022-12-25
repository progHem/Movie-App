import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/extensions.dart';

import '../../core/theme/theme_colors.dart';
import '../components/ellipse.dart';

class ScaffoldBackground extends StatelessWidget {
  final Widget child;
  const ScaffoldBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SizedBox(
        width: context.w,
        height: context.h,
        child: Stack(
          children: [
            const Positioned(
                top: -100,
                left: -100,
                child: Ellipse(color: greenColor, width: 200.0, height: 200.0)),
            Positioned(
                top: context.h * 0.4,
                right: -50,
                child: const Ellipse(color: pinkColor, width: 166.0, height: 166.0)),
            const Positioned(
                bottom: -100,
                left: -100,
                child: Ellipse(color: cyanColor, width: 200.0, height: 200.0)),
            SafeArea(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
