import 'package:flutter/material.dart';

import 'minilo_tokens.dart';

@immutable
class MiniloTheme extends ThemeExtension<MiniloTheme> {
  const MiniloTheme({
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.shadows,
  });

  final MiniloColors colors;
  final MiniloSpacing spacing;
  final MiniloRadius radius;
  final MiniloShadows shadows;

  factory MiniloTheme.light() => const MiniloTheme(
        colors: MiniloColors.light,
        spacing: MiniloSpacing.standard,
        radius: MiniloRadius.standard,
        shadows: MiniloShadows.standard,
      );

  factory MiniloTheme.dark() => const MiniloTheme(
        colors: MiniloColors.dark,
        spacing: MiniloSpacing.standard,
        radius: MiniloRadius.standard,
        shadows: MiniloShadows.standard,
      );

  @override
  MiniloTheme copyWith({
    MiniloColors? colors,
    MiniloSpacing? spacing,
    MiniloRadius? radius,
    MiniloShadows? shadows,
  }) {
    return MiniloTheme(
      colors: colors ?? this.colors,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  MiniloTheme lerp(covariant ThemeExtension<MiniloTheme>? other, double t) {
    if (other is! MiniloTheme) {
      return this;
    }

    return MiniloTheme(
      colors: MiniloColors.lerp(colors, other.colors, t),
      spacing: MiniloSpacing.lerp(spacing, other.spacing, t),
      radius: MiniloRadius.lerp(radius, other.radius, t),
      shadows: MiniloShadows.lerp(shadows, other.shadows, t),
    );
  }
}

ThemeData miniloThemeData({
  Brightness brightness = Brightness.light,
  MiniloTheme? minilo,
}) {
  final MiniloTheme resolved = minilo ??
      (brightness == Brightness.dark
          ? MiniloTheme.dark()
          : MiniloTheme.light());
  final colors = resolved.colors;

  final scheme = ColorScheme(
    brightness: brightness,
    primary: colors.primary,
    onPrimary: colors.textInverse,
    secondary: colors.secondary,
    onSecondary: colors.white,
    error: colors.alert,
    onError: colors.white,
    surface: colors.surface,
    onSurface: colors.text,
    outline: colors.border,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: colors.background,
    textTheme: MiniloTypography.textTheme(
        colors.text, colors.textMuted, colors.primary),
    fontFamily: MiniloTypography.fontFamily,
    extensions: <ThemeExtension<dynamic>>[resolved],
    dividerColor: colors.border,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.text,
      surfaceTintColor: colors.surface,
    ),
  );
}

extension MiniloThemeContext on BuildContext {
  MiniloTheme get minilo {
    return Theme.of(this).extension<MiniloTheme>() ??
        (Theme.of(this).brightness == Brightness.dark
            ? MiniloTheme.dark()
            : MiniloTheme.light());
  }
}
