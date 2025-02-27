import 'package:flutter/material.dart';

class TypographyThemeConstants {
  final TextStyle subtitle;
  final TextStyle subtitleSemiBold;
  final TextStyle headingSmall;
  final TextStyle paragraph;
  final TextStyle buttonText;
  final TextStyle description;

  TypographyThemeConstants({
    this.subtitle = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'WorkSans',
      color: Color(0xFF001C95),
    ),
    this.subtitleSemiBold = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w600,
      color: Color(0xFF001C95),
    ),
    this.headingSmall = const TextStyle(
      fontSize: 20.0,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500,
      color: Color(0xFF1E2A32),
    ),
    this.paragraph = const TextStyle(
      fontSize: 14.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w400,
      color: Color(0xFF708797),
    ),
    this.buttonText = const TextStyle(
      fontSize: 16.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    this.description = const TextStyle(
      fontSize: 12.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w400,
      color: Color(0xFF708797),
    ),
  });
}

TypographyThemeConstants get typography => TypographyThemeConstants();

class SpacingConstants {
  final Widget v16;
  final Widget v24;

  SpacingConstants({
    this.v16 = const SizedBox(height: 16.0),
    this.v24 = const SizedBox(height: 24.0),
  });
}

SpacingConstants get spacing => SpacingConstants();

class ColorConstants {
  final Color primary;
  final Color white;
  final Color shadowColor;

  ColorConstants({
    this.primary = const Color(0xFF001C95),
    this.white = const Color(0xFFFFFFFF),
    this.shadowColor = const Color(0x141E2A32),
  });
}

ColorConstants get color => ColorConstants();
