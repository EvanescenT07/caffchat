import 'package:flutter/material.dart';

abstract final class CaffRadius {
  static const double sm = 4;
  static const double base = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static final BorderRadius smAll = BorderRadius.circular(sm);
  static final BorderRadius baseAll = BorderRadius.circular(base);
  static final BorderRadius mdAll = BorderRadius.circular(md);
  static final BorderRadius lgAll = BorderRadius.circular(lg);
  static final BorderRadius xlAll = BorderRadius.circular(xl);
  static final BorderRadius full = BorderRadius.circular(9999);
}