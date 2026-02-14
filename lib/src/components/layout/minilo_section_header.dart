import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

class MiniloSectionHeader extends StatelessWidget {
  const MiniloSectionHeader({
    super.key,
    this.eyebrow = 'Section',
    this.title = 'Minilo section title',
    this.description =
        'Use this header to introduce content blocks with consistent hierarchy.',
    this.actionText,
    this.onAction,
  });

  final String eyebrow;
  final String title;
  final String description;
  final String? actionText;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(minilo.spacing.s4),
      decoration: BoxDecoration(
        color: minilo.colors.surface,
        border: Border.all(color: minilo.colors.border),
        borderRadius: BorderRadius.circular(minilo.radius.md),
      ),
      child: Wrap(
        runSpacing: minilo.spacing.s4,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: minilo.colors.secondary,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: minilo.spacing.s2),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: minilo.colors.primary,
                      ),
                ),
                SizedBox(height: minilo.spacing.s2),
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: minilo.colors.textMuted),
                ),
              ],
            ),
          ),
          if (actionText != null)
            OutlinedButton(
              onPressed: onAction,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: minilo.colors.primary),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(minilo.radius.sm)),
                foregroundColor: minilo.colors.primary,
              ),
              child: Text(actionText!),
            ),
        ],
      ),
    );
  }
}
