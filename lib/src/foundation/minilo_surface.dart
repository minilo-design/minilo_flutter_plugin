import 'package:flutter/material.dart';

import 'minilo_theme.dart';

class MiniloSurface extends StatelessWidget {
  const MiniloSurface({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.border,
    this.color,
    this.shadow,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Color? color;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? minilo.colors.surface,
        borderRadius: borderRadius ?? BorderRadius.circular(minilo.radius.md),
        border: border ?? Border.all(color: minilo.colors.border),
        boxShadow: shadow,
      ),
      child: child,
    );
  }
}
