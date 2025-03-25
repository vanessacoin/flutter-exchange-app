import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006876),
      surfaceTint: Color(0xff006876),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9fefff),
      onPrimaryContainer: Color(0xff004e59),
      secondary: Color(0xff116b56),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa3f2d8),
      onSecondaryContainer: Color(0xff005140),
      tertiary: Color(0xff1f6a4e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa8f2ce),
      onTertiaryContainer: Color(0xff005138),
      error: Color(0xff904a43),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad5),
      onErrorContainer: Color(0xff73342d),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbfc8ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff82d3e2),
      primaryFixed: Color(0xff9fefff),
      onPrimaryFixed: Color(0xff001f24),
      primaryFixedDim: Color(0xff82d3e2),
      onPrimaryFixedVariant: Color(0xff004e59),
      secondaryFixed: Color(0xffa3f2d8),
      onSecondaryFixed: Color(0xff002018),
      secondaryFixedDim: Color(0xff87d6bd),
      onSecondaryFixedVariant: Color(0xff005140),
      tertiaryFixed: Color(0xffa8f2ce),
      onTertiaryFixed: Color(0xff002115),
      tertiaryFixedDim: Color(0xff8dd5b3),
      onTertiaryFixedVariant: Color(0xff005138),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c45),
      surfaceTint: Color(0xff006876),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1a7886),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003e31),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff287a65),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003f2b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff317a5c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e231e),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa25850),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff0c1213),
      onSurfaceVariant: Color(0xff2f3839),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f70),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff82d3e2),
      primaryFixed: Color(0xff1a7886),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005e6a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff287a65),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00614d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff317a5c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff116145),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c8c9),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe3e9ea),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd3d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003139),
      surfaceTint: Color(0xff006876),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00515c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003328),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005442),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003322),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00543a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511a15),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff76362f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e2f),
      outlineVariant: Color(0xff414b4c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff82d3e2),
      primaryFixed: Color(0xff00515c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003941),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005442),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003a2e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00543a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003b28),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4babb),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f3),
      surfaceContainer: Color(0xffdee3e4),
      surfaceContainerHigh: Color(0xffcfd5d6),
      surfaceContainerHighest: Color(0xffc2c8c9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff82d3e2),
      surfaceTint: Color(0xff82d3e2),
      onPrimary: Color(0xff00363e),
      primaryContainer: Color(0xff004e59),
      onPrimaryContainer: Color(0xff9fefff),
      secondary: Color(0xff87d6bd),
      onSecondary: Color(0xff00382c),
      secondaryContainer: Color(0xff005140),
      onSecondaryContainer: Color(0xffa3f2d8),
      tertiary: Color(0xff8dd5b3),
      onTertiary: Color(0xff003826),
      tertiaryContainer: Color(0xff005138),
      onTertiaryContainer: Color(0xffa8f2ce),
      error: Color(0xffffb4ab),
      onError: Color(0xff561e19),
      errorContainer: Color(0xff73342d),
      onErrorContainer: Color(0xffffdad5),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e4),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e4),
      inversePrimary: Color(0xff006876),
      primaryFixed: Color(0xff9fefff),
      onPrimaryFixed: Color(0xff001f24),
      primaryFixedDim: Color(0xff82d3e2),
      onPrimaryFixedVariant: Color(0xff004e59),
      secondaryFixed: Color(0xffa3f2d8),
      onSecondaryFixed: Color(0xff002018),
      secondaryFixedDim: Color(0xff87d6bd),
      onSecondaryFixedVariant: Color(0xff005140),
      tertiaryFixed: Color(0xffa8f2ce),
      onTertiaryFixed: Color(0xff002115),
      tertiaryFixedDim: Color(0xff8dd5b3),
      onTertiaryFixedVariant: Color(0xff005138),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff98e9f9),
      surfaceTint: Color(0xff82d3e2),
      onPrimary: Color(0xff002a31),
      primaryContainer: Color(0xff499cab),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9decd2),
      onSecondary: Color(0xff002c22),
      secondaryContainer: Color(0xff509f88),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa2ecc8),
      onTertiary: Color(0xff002c1d),
      tertiaryContainer: Color(0xff579e7f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff48130f),
      errorContainer: Color(0xffcc7b72),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dee0),
      outline: Color(0xffaab4b5),
      outlineVariant: Color(0xff889294),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e4),
      inversePrimary: Color(0xff00505a),
      primaryFixed: Color(0xff9fefff),
      onPrimaryFixed: Color(0xff001418),
      primaryFixedDim: Color(0xff82d3e2),
      onPrimaryFixedVariant: Color(0xff003c45),
      secondaryFixed: Color(0xffa3f2d8),
      onSecondaryFixed: Color(0xff00150f),
      secondaryFixedDim: Color(0xff87d6bd),
      onSecondaryFixedVariant: Color(0xff003e31),
      tertiaryFixed: Color(0xffa8f2ce),
      onTertiaryFixed: Color(0xff00150c),
      tertiaryFixedDim: Color(0xff8dd5b3),
      onTertiaryFixedVariant: Color(0xff003f2b),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff3f4647),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191f20),
      surfaceContainer: Color(0xff23292a),
      surfaceContainerHigh: Color(0xff2d3435),
      surfaceContainerHighest: Color(0xff393f40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd0f7ff),
      surfaceTint: Color(0xff82d3e2),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7ecfde),
      onPrimaryContainer: Color(0xff000d11),
      secondary: Color(0xffb5ffe6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff83d2b9),
      onSecondaryContainer: Color(0xff000e09),
      tertiary: Color(0xffb9ffdc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff89d1af),
      onTertiaryContainer: Color(0xff000e07),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f3),
      outlineVariant: Color(0xffbbc4c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e4),
      inversePrimary: Color(0xff00505a),
      primaryFixed: Color(0xff9fefff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff82d3e2),
      onPrimaryFixedVariant: Color(0xff001418),
      secondaryFixed: Color(0xffa3f2d8),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff87d6bd),
      onSecondaryFixedVariant: Color(0xff00150f),
      tertiaryFixed: Color(0xffa8f2ce),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff8dd5b3),
      onTertiaryFixedVariant: Color(0xff00150c),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff4b5152),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2122),
      surfaceContainer: Color(0xff2b3133),
      surfaceContainerHigh: Color(0xff363c3e),
      surfaceContainerHighest: Color(0xff424849),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
