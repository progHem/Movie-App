import 'package:flutter/material.dart';

extension ScreanSize on BuildContext {
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
}
