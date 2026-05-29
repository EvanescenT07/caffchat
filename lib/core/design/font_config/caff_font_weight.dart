import 'dart:ui';

class CaffFontWeight {
  final FontWeight value;
  const CaffFontWeight._(this.value);

  static const CaffFontWeight thin =
      CaffFontWeight._(FontWeight.w100);
  static const CaffFontWeight xLight =
      CaffFontWeight._(FontWeight.w200);
  static const CaffFontWeight light =
      CaffFontWeight._(FontWeight.w300);
  static const CaffFontWeight regular =
      CaffFontWeight._(FontWeight.w400);
  static const CaffFontWeight medium =
      CaffFontWeight._(FontWeight.w500);
  static const CaffFontWeight semiBold =
      CaffFontWeight._(FontWeight.w600);
  static const CaffFontWeight bold =
      CaffFontWeight._(FontWeight.w700);
  static const CaffFontWeight xBold =
      CaffFontWeight._(FontWeight.w800);
  static const CaffFontWeight black =
      CaffFontWeight._(FontWeight.w900);
}
