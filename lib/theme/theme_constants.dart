import 'package:flutter/material.dart';

class TypographyThemeConstants {
  final TextStyle subtitle;
  final TextStyle subtitleSemiBold;
  final TextStyle headingSmall;
  final TextStyle paragraph;
  final TextStyle paragraphSemiBold;
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
    this.paragraphSemiBold = const TextStyle(
      fontSize: 14.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w600,
      color: Color(0xFF4D6475),
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
  final Widget v4;
  final Widget v16;
  final Widget v24;
  final Widget v32;

  SpacingConstants({
    this.v4 = const SizedBox(height: 4.0),
    this.v16 = const SizedBox(height: 16.0),
    this.v24 = const SizedBox(height: 24.0),
    this.v32 = const SizedBox(height: 32.0),
  });
}

SpacingConstants get spacing => SpacingConstants();

class PaddingConstants {
  final EdgeInsets all16;

  PaddingConstants({this.all16 = const EdgeInsets.all(16.0)});
}

PaddingConstants get padding => PaddingConstants();

class BorderConstants {
  final BorderRadius all4;
  final BorderRadius all8;

  BorderConstants({
    this.all4 = const BorderRadius.all(Radius.circular(4.0)),
    this.all8 = const BorderRadius.all(Radius.circular(8.0)),
  });
}

BorderConstants get border => BorderConstants();

class ColorConstants {
  final Color primary;
  final Color white;
  final Color shadowColor;
  final Color lightGray;
  final Color darkGray;

  final Color green;
  final Color yellow;
  final Color red;

  final Color scaffoldBackgroundColor;

  ColorConstants({
    this.primary = const Color(0xFF001C95),
    this.white = const Color(0xFFFFFFFF),
    this.shadowColor = const Color(0x141E2A32),
    this.lightGray = const Color(0xFFE9EEF2),
    this.darkGray = const Color(0xFF4D6475),
    this.green = const Color(0xFF04C761),
    this.yellow = const Color(0xFFFFC032),
    this.red = const Color(0xFFD32A36),
    this.scaffoldBackgroundColor = const Color(0xFFF4F8FA),
  });
}

ColorConstants get color => ColorConstants();
