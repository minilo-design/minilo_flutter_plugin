import 'package:flutter/material.dart';
import '../../foundation/minilo_theme.dart';

class MiniloLinearProgress extends StatelessWidget {
  const MiniloLinearProgress({
    super.key,
    required this.value,
    this.height = 8.0,
    this.backgroundColor,
    this.color,
  });

  /// Value between 0.0 and 1.0
  final double value;
  final double height;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: LinearProgressIndicator(
        value: value,
        minHeight: height,
        backgroundColor: backgroundColor ?? minilo.colors.border,
        color: color ?? minilo.colors.primary,
      ),
    );
  }
}
