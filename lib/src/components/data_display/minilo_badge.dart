import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

enum MiniloBadgeTone {
  neutral,
  info,
  success,
  warning,
  error,
}

enum MiniloBadgeSize {
  sm,
  md,
}

class MiniloBadge extends StatelessWidget {
  const MiniloBadge({
    super.key,
    this.label = 'Label',
    this.tone = MiniloBadgeTone.neutral,
    this.size = MiniloBadgeSize.md,
    this.filled = false,
  });

  final String label;
  final MiniloBadgeTone tone;
  final MiniloBadgeSize size;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    final foreground = switch (tone) {
      MiniloBadgeTone.neutral => minilo.colors.textMuted,
      MiniloBadgeTone.info => minilo.colors.secondary,
      MiniloBadgeTone.success => minilo.colors.success,
      MiniloBadgeTone.warning => minilo.colors.warning,
      MiniloBadgeTone.error => minilo.colors.alert,
    };

    final background = filled
        ? foreground.withValues(alpha: 0.15)
        : minilo.colors.surfaceMuted;

    final borderColor = filled ? Colors.transparent : minilo.colors.border;
    final padding = size == MiniloBadgeSize.sm
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
        : const EdgeInsets.symmetric(horizontal: 10, vertical: 6);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(minilo.radius.full),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
