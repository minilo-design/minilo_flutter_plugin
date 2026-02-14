import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

@immutable
class MiniloStepData {
  const MiniloStepData({
    required this.title,
    this.subtitle,
    this.complete = false,
  });

  final String title;
  final String? subtitle;
  final bool complete;
}

class MiniloStepperDesktop extends StatelessWidget {
  const MiniloStepperDesktop({
    super.key,
    required this.steps,
    required this.currentStep,
    this.onStepTap,
  });

  final List<MiniloStepData> steps;
  final int currentStep;
  final ValueChanged<int>? onStepTap;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return Row(
      children: List<Widget>.generate(steps.length, (index) {
        final step = steps[index];
        final isActive = index == currentStep;
        final isComplete = step.complete || index < currentStep;

        final bulletColor = isComplete
            ? const Color(0xFF005A30)
            : isActive
                ? minilo.colors.primary
                : const Color(0xFFB1B4B6);

        return Expanded(
          child: InkWell(
            onTap: () => onStepTap?.call(index),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: minilo.colors.surface,
                        border: Border.all(color: bulletColor, width: 2),
                      ),
                      alignment: Alignment.center,
                      child: isComplete
                          ? const Icon(Icons.check,
                              size: 14, color: Color(0xFF005A30))
                          : Text(
                              '${index + 1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: bulletColor),
                            ),
                    ),
                    if (index < steps.length - 1)
                      Container(
                        width: 2,
                        height: 24,
                        color: const Color(0xFFB1B4B6),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isActive
                                  ? minilo.colors.primary
                                  : const Color(0xFF383F43),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      if (step.subtitle != null)
                        Text(
                          step.subtitle!,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF383F43),
                                  ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
