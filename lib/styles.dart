import 'package:flutter/material.dart';

class UiColors {
  static const Color spaceCadet = Color(0xFF29335C);
  static const Color redSalsa = Color(0xFFFB3640);
  static const Color richBlack = Color(0xFF0D1821);
  static const Color backgroundGrey = Color(0xFFF3F3F3);
  static const Color white = Colors.white;
}

class UiTextStyles {
  static const TextStyle montserrat27ptSemiBoldWhite = TextStyle(
    color: UiColors.white,
    fontSize: 27.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle montserrat16ptSemiBoldRed = TextStyle(
    color: UiColors.redSalsa,
    fontSize: 16.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle montserrat16ptSemiBoldSpaceCadet = TextStyle(
    color: UiColors.spaceCadet,
    fontSize: 16.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle montserrat16ptSemiBoldWhite = TextStyle(
    color: UiColors.white,
    fontSize: 16.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle montserrat20ptSemiBoldRed = TextStyle(
    color: UiColors.redSalsa,
    fontSize: 20.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle montserrat30ptBoldSpaceCadet = TextStyle(
    color: UiColors.spaceCadet,
    fontSize: 30.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );
}
