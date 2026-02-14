import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

class MiniloStepperMobile extends StatelessWidget {
  const MiniloStepperMobile({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.title,
  }) : assert(totalSteps > 0, 'totalSteps must be > 0');

  final int currentStep;
  final int totalSteps;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    final progress = (currentStep / totalSteps).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: minilo.colors.text,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        Row(
          children: [
            Text(
              'Step $currentStep/$totalSteps',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: minilo.colors.primary,
                  ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(minilo.radius.full),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: progress,
                  backgroundColor: const Color(0xFFE6EAF2),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(minilo.colors.primary),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
