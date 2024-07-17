import 'package:flutter/material.dart';

extension StringExtensions on String {
  String get png {
    return "assets/images/$this.png";
  }
  String get svg {
    return "assets/images/$this.svg";
  }
}

extension InkWellExtensions on InkWell {
  InkWell get noShadow => InkWell(
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: child,
      );
}
