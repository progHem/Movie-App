import 'dart:ui';

import 'package:flutter/material.dart';

class Ellipse extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  const Ellipse(
      {super.key,
      required this.color,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.5),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 100,
          sigmaY: 100,
        ),
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
