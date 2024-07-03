import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle display4(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle display3(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle display2(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle display1(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle headline(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 18,
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle subhead(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle body2(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle body1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle button(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle subtitle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
          fontFamily: 'WorkSans',
        );
  }

  static TextStyle overline(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontFamily: 'WorkSans',
        );
  }
}
