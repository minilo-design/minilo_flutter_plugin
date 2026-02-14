import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

@immutable
class MiniloColors {
  const MiniloColors({
    required this.white,
    required this.black,
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.border,
    required this.primary,
    required this.primaryStrong,
    required this.secondary,
    required this.secondarySoft,
    required this.text,
    required this.textMuted,
    required this.textInverse,
    required this.success,
    required this.successSoft,
    required this.alert,
    required this.alertSoft,
    required this.warning,
    required this.warningSoft,
  });

  final Color white;
  final Color black;

  final Color background;
  final Color surface;
  final Color surfaceMuted;
  final Color border;

  final Color primary;
  final Color primaryStrong;
  final Color secondary;
  final Color secondarySoft;

  final Color text;
  final Color textMuted;
  final Color textInverse;

  final Color success;
  final Color successSoft;
  final Color alert;
  final Color alertSoft;
  final Color warning;
  final Color warningSoft;

  static const MiniloColors light = MiniloColors(
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    background: Color(0xFFFDFCFF),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF7F9FC),
    border: Color(0xFFE9E9E9),
    primary: Color(0xFF003078),
    primaryStrong: Color(0xFF002060),
    secondary: Color(0xFF0061A8),
    secondarySoft: Color(0xFFB3D7F2),
    text: Color(0xFF333333),
    textMuted: Color(0xFF667085),
    textInverse: Color(0xFFF8FAFC),
    success: Color(0xFF005A30),
    successSoft: Color(0x33005A30),
    alert: Color(0xFFE63946),
    alertSoft: Color(0xFFFFD3D5),
    warning: Color(0xFFB45309),
    warningSoft: Color(0x33B45309),
  );

  static const MiniloColors dark = MiniloColors(
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    background: Color(0xFF181818),
    surface: Color(0xFF0F172A),
    surfaceMuted: Color(0xFF111827),
    border: Color(0xFF3A3A3A),
    primary: Color(0xFF93C5FD),
    primaryStrong: Color(0xFFBFDBFE),
    secondary: Color(0xFF60A5FA),
    secondarySoft: Color(0x3360A5FA),
    text: Color(0xFFFFFFFF),
    textMuted: Color(0xFFA3A3A3),
    textInverse: Color(0xFF0F172A),
    success: Color(0xFF22C55E),
    successSoft: Color(0x2E22C55E),
    alert: Color(0xFFE63946),
    alertSoft: Color(0x33E63946),
    warning: Color(0xFFF59E0B),
    warningSoft: Color(0x33F59E0B),
  );

  MiniloColors copyWith({
    Color? white,
    Color? black,
    Color? background,
    Color? surface,
    Color? surfaceMuted,
    Color? border,
    Color? primary,
    Color? primaryStrong,
    Color? secondary,
    Color? secondarySoft,
    Color? text,
    Color? textMuted,
    Color? textInverse,
    Color? success,
    Color? successSoft,
    Color? alert,
    Color? alertSoft,
    Color? warning,
    Color? warningSoft,
  }) {
    return MiniloColors(
      white: white ?? this.white,
      black: black ?? this.black,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      border: border ?? this.border,
      primary: primary ?? this.primary,
      primaryStrong: primaryStrong ?? this.primaryStrong,
      secondary: secondary ?? this.secondary,
      secondarySoft: secondarySoft ?? this.secondarySoft,
      text: text ?? this.text,
      textMuted: textMuted ?? this.textMuted,
      textInverse: textInverse ?? this.textInverse,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      alert: alert ?? this.alert,
      alertSoft: alertSoft ?? this.alertSoft,
      warning: warning ?? this.warning,
      warningSoft: warningSoft ?? this.warningSoft,
    );
  }

  static MiniloColors lerp(MiniloColors a, MiniloColors b, double t) {
    return MiniloColors(
      white: Color.lerp(a.white, b.white, t) ?? a.white,
      black: Color.lerp(a.black, b.black, t) ?? a.black,
      background: Color.lerp(a.background, b.background, t) ?? a.background,
      surface: Color.lerp(a.surface, b.surface, t) ?? a.surface,
      surfaceMuted:
          Color.lerp(a.surfaceMuted, b.surfaceMuted, t) ?? a.surfaceMuted,
      border: Color.lerp(a.border, b.border, t) ?? a.border,
      primary: Color.lerp(a.primary, b.primary, t) ?? a.primary,
      primaryStrong:
          Color.lerp(a.primaryStrong, b.primaryStrong, t) ?? a.primaryStrong,
      secondary: Color.lerp(a.secondary, b.secondary, t) ?? a.secondary,
      secondarySoft:
          Color.lerp(a.secondarySoft, b.secondarySoft, t) ?? a.secondarySoft,
      text: Color.lerp(a.text, b.text, t) ?? a.text,
      textMuted: Color.lerp(a.textMuted, b.textMuted, t) ?? a.textMuted,
      textInverse: Color.lerp(a.textInverse, b.textInverse, t) ?? a.textInverse,
      success: Color.lerp(a.success, b.success, t) ?? a.success,
      successSoft: Color.lerp(a.successSoft, b.successSoft, t) ?? a.successSoft,
      alert: Color.lerp(a.alert, b.alert, t) ?? a.alert,
      alertSoft: Color.lerp(a.alertSoft, b.alertSoft, t) ?? a.alertSoft,
      warning: Color.lerp(a.warning, b.warning, t) ?? a.warning,
      warningSoft: Color.lerp(a.warningSoft, b.warningSoft, t) ?? a.warningSoft,
    );
  }
}

@immutable
class MiniloSpacing {
  const MiniloSpacing({
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.s5,
    required this.s6,
    required this.s8,
    required this.s10,
    required this.s12,
    required this.s16,
  });

  final double s1;
  final double s2;
  final double s3;
  final double s4;
  final double s5;
  final double s6;
  final double s8;
  final double s10;
  final double s12;
  final double s16;

  static const MiniloSpacing standard = MiniloSpacing(
    s1: 4,
    s2: 8,
    s3: 12,
    s4: 16,
    s5: 20,
    s6: 24,
    s8: 32,
    s10: 40,
    s12: 48,
    s16: 64,
  );

  static MiniloSpacing lerp(MiniloSpacing a, MiniloSpacing b, double t) {
    return MiniloSpacing(
      s1: lerpDouble(a.s1, b.s1, t) ?? a.s1,
      s2: lerpDouble(a.s2, b.s2, t) ?? a.s2,
      s3: lerpDouble(a.s3, b.s3, t) ?? a.s3,
      s4: lerpDouble(a.s4, b.s4, t) ?? a.s4,
      s5: lerpDouble(a.s5, b.s5, t) ?? a.s5,
      s6: lerpDouble(a.s6, b.s6, t) ?? a.s6,
      s8: lerpDouble(a.s8, b.s8, t) ?? a.s8,
      s10: lerpDouble(a.s10, b.s10, t) ?? a.s10,
      s12: lerpDouble(a.s12, b.s12, t) ?? a.s12,
      s16: lerpDouble(a.s16, b.s16, t) ?? a.s16,
    );
  }
}

@immutable
class MiniloRadius {
  const MiniloRadius({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.full,
  });

  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double full;

  static const MiniloRadius standard = MiniloRadius(
    sm: 4,
    md: 8,
    lg: 16,
    xl: 24,
    full: 999,
  );

  static MiniloRadius lerp(MiniloRadius a, MiniloRadius b, double t) {
    return MiniloRadius(
      sm: lerpDouble(a.sm, b.sm, t) ?? a.sm,
      md: lerpDouble(a.md, b.md, t) ?? a.md,
      lg: lerpDouble(a.lg, b.lg, t) ?? a.lg,
      xl: lerpDouble(a.xl, b.xl, t) ?? a.xl,
      full: lerpDouble(a.full, b.full, t) ?? a.full,
    );
  }
}

@immutable
class MiniloShadows {
  const MiniloShadows({
    required this.sm,
    required this.md,
    required this.lg,
  });

  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;

  static const MiniloShadows standard = MiniloShadows(
    sm: [
      BoxShadow(
        color: Color(0x140F172A),
        blurRadius: 2,
        offset: Offset(0, 1),
      )
    ],
    md: [
      BoxShadow(
        color: Color(0x170F172A),
        blurRadius: 30,
        offset: Offset(0, 10),
      )
    ],
    lg: [
      BoxShadow(
        color: Color(0x240F172A),
        blurRadius: 44,
        offset: Offset(0, 24),
      )
    ],
  );

  static MiniloShadows lerp(MiniloShadows a, MiniloShadows b, double t) {
    List<BoxShadow> lerpList(List<BoxShadow> x, List<BoxShadow> y) {
      final maxLen = x.length > y.length ? x.length : y.length;
      return List<BoxShadow>.generate(maxLen, (index) {
        final start = index < x.length ? x[index] : const BoxShadow();
        final end = index < y.length ? y[index] : const BoxShadow();
        return BoxShadow.lerp(start, end, t) ?? start;
      });
    }

    return MiniloShadows(
      sm: lerpList(a.sm, b.sm),
      md: lerpList(a.md, b.md),
      lg: lerpList(a.lg, b.lg),
    );
  }
}

class MiniloTypography {
  MiniloTypography._();

  static const String fontFamily = 'Noto Sans';

  static TextTheme textTheme(
      Color textColor, Color mutedColor, Color primaryColor) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w800,
        height: 1.2,
        color: primaryColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: primaryColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: primaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.4,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: mutedColor,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.2,
        color: mutedColor,
      ),
    );
  }
}
