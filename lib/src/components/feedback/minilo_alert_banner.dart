import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

enum MiniloAlertVariant {
  info,
  success,
  warning,
  error,
}

class MiniloAlertBanner extends StatelessWidget {
  const MiniloAlertBanner({
    super.key,
    this.title = 'System notice',
    this.message = 'Your system message appears here.',
    this.variant = MiniloAlertVariant.info,
    this.dismissible = false,
    this.onDismiss,
  });

  final String title;
  final String message;
  final MiniloAlertVariant variant;
  final bool dismissible;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    final tone = switch (variant) {
      MiniloAlertVariant.info => minilo.colors.secondary,
      MiniloAlertVariant.success => minilo.colors.success,
      MiniloAlertVariant.warning => minilo.colors.warning,
      MiniloAlertVariant.error => minilo.colors.alert,
    };

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: minilo.spacing.s4, vertical: minilo.spacing.s3),
      decoration: BoxDecoration(
        color: minilo.colors.surface,
        borderRadius: BorderRadius.circular(minilo.radius.md),
        border: Border(
          left: BorderSide(color: tone, width: 4),
          top: BorderSide(color: minilo.colors.border),
          right: BorderSide(color: minilo.colors.border),
          bottom: BorderSide(color: minilo.colors.border),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 7),
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: tone, shape: BoxShape.circle),
          ),
          SizedBox(width: minilo.spacing.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: minilo.colors.text),
                ),
                SizedBox(height: minilo.spacing.s1),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (dismissible) ...[
            SizedBox(width: minilo.spacing.s2),
            OutlinedButton(
              onPressed: onDismiss,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: minilo.colors.border),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(minilo.radius.sm)),
                foregroundColor: minilo.colors.primary,
                textStyle: Theme.of(context).textTheme.labelMedium,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              ),
              child: const Text('Dismiss'),
            ),
          ],
        ],
      ),
    );
  }
}
