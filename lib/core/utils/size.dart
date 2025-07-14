import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get deviceWidth => MediaQuery.sizeOf(this).width;
  double get deviceHeight => MediaQuery.sizeOf(this).height;
}
