import 'package:flutter/material.dart';

class R {
  static double sh(double h, BuildContext context) {
    return MediaQuery.sizeOf(context).height * (h / 810);
  }

  static double sw(double w, BuildContext context) {
    return MediaQuery.sizeOf(context).width * (w / 375);
  }
}
