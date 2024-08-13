import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff5a5891),
      surfaceTint: Color(0xff5a5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe3dfff),
      onPrimaryContainer: Color(0xff16134a),
      secondary: Color(0xff595992),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe2dfff),
      onSecondaryContainer: Color(0xff14134a),
      tertiary: Color(0xff465d91),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd9e2ff),
      onTertiaryContainer: Color(0xff001943),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffcf8ff),
      onBackground: Color(0xff1c1b21),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1c1b21),
      surfaceVariant: Color(0xffe4e1ec),
      onSurfaceVariant: Color(0xff47464f),
      outline: Color(0xff787680),
      outlineVariant: Color(0xffc8c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inverseOnSurface: Color(0xfff3eff7),
      inversePrimary: Color(0xffc4c0ff),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff16134a),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff434078),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff14134a),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff414178),
      tertiaryFixed: Color(0xffd9e2ff),
      onTertiaryFixed: Color(0xff001943),
      tertiaryFixedDim: Color(0xffafc6ff),
      onTertiaryFixedVariant: Color(0xff2d4678),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3f3c74),
      surfaceTint: Color(0xff5a5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff716ea9),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3d3d74),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f6faa),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff294274),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5c74a9),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffcf8ff),
      onBackground: Color(0xff1c1b21),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1c1b21),
      surfaceVariant: Color(0xffe4e1ec),
      onSurfaceVariant: Color(0xff43424b),
      outline: Color(0xff605e67),
      outlineVariant: Color(0xff7b7983),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inverseOnSurface: Color(0xfff3eff7),
      inversePrimary: Color(0xffc4c0ff),
      primaryFixed: Color(0xff716ea9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff58568f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f6faa),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff56568f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5c74a9),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff435b8f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff1d1a51),
      surfaceTint: Color(0xff5a5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3f3c74),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1b1b51),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3d3d74),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002050),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff294274),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffcf8ff),
      onBackground: Color(0xff1c1b21),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffe4e1ec),
      onSurfaceVariant: Color(0xff24232b),
      outline: Color(0xff43424b),
      outlineVariant: Color(0xff43424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffede9ff),
      primaryFixed: Color(0xff3f3c74),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff28265c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3d3d74),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff26265c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff294274),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0e2b5c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc4c0ff),
      surfaceTint: Color(0xffc4c0ff),
      onPrimary: Color(0xff2c2960),
      primaryContainer: Color(0xff434078),
      onPrimaryContainer: Color(0xffe3dfff),
      secondary: Color(0xffc2c1ff),
      onSecondary: Color(0xff2a2a60),
      secondaryContainer: Color(0xff414178),
      onSecondaryContainer: Color(0xffe2dfff),
      tertiary: Color(0xffafc6ff),
      onTertiary: Color(0xff132f60),
      tertiaryContainer: Color(0xff2d4678),
      onTertiaryContainer: Color(0xffd9e2ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff131318),
      onBackground: Color(0xffe5e1e9),
      surface: Color(0xff131318),
      onSurface: Color(0xffe5e1e9),
      surfaceVariant: Color(0xff47464f),
      onSurfaceVariant: Color(0xffc8c5d0),
      outline: Color(0xff928f9a),
      outlineVariant: Color(0xff47464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inverseOnSurface: Color(0xff313036),
      inversePrimary: Color(0xff5a5891),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff16134a),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff434078),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff14134a),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff414178),
      tertiaryFixed: Color(0xffd9e2ff),
      onTertiaryFixed: Color(0xff001943),
      tertiaryFixedDim: Color(0xffafc6ff),
      onTertiaryFixedVariant: Color(0xff2d4678),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc8c5ff),
      surfaceTint: Color(0xffc4c0ff),
      onPrimary: Color(0xff110c45),
      primaryContainer: Color(0xff8d8ac8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc7c5ff),
      onSecondary: Color(0xff0f0d45),
      secondaryContainer: Color(0xff8b8bc8),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb5caff),
      onTertiary: Color(0xff001439),
      tertiaryContainer: Color(0xff7890c7),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131318),
      onBackground: Color(0xffe5e1e9),
      surface: Color(0xff131318),
      onSurface: Color(0xfffdf9ff),
      surfaceVariant: Color(0xff47464f),
      onSurfaceVariant: Color(0xffccc9d4),
      outline: Color(0xffa4a1ac),
      outlineVariant: Color(0xff84828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inverseOnSurface: Color(0xff2a292f),
      inversePrimary: Color(0xff444279),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff0b0640),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff322f66),
      secondaryFixed: Color(0xffe2dfff),
      onSecondaryFixed: Color(0xff090640),
      secondaryFixedDim: Color(0xffc2c1ff),
      onSecondaryFixedVariant: Color(0xff303066),
      tertiaryFixed: Color(0xffd9e2ff),
      onTertiaryFixed: Color(0xff00102f),
      tertiaryFixedDim: Color(0xffafc6ff),
      onTertiaryFixedVariant: Color(0xff1a3566),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdf9ff),
      surfaceTint: Color(0xffc4c0ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc8c5ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdf9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc7c5ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffcfaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb5caff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff131318),
      onBackground: Color(0xffe5e1e9),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff47464f),
      onSurfaceVariant: Color(0xfffdf9ff),
      outline: Color(0xffccc9d4),
      outlineVariant: Color(0xffccc9d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff252359),
      primaryFixed: Color(0xffe7e4ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc8c5ff),
      onPrimaryFixedVariant: Color(0xff110c45),
      secondaryFixed: Color(0xffe7e4ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc7c5ff),
      onSecondaryFixedVariant: Color(0xff0f0d45),
      tertiaryFixed: Color(0xffdfe6ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb5caff),
      onTertiaryFixedVariant: Color(0xff001439),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
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

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
