import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_surface.dart';
import '../../foundation/minilo_theme.dart';

enum MiniloStatTrend {
  up,
  down,
  flat,
}

class MiniloStatCard extends StatelessWidget {
  const MiniloStatCard({
    super.key,
    this.label = 'Weekly active users',
    this.value = '12,840',
    this.helper = '+8.4% from previous week',
    this.trend = MiniloStatTrend.up,
    this.loading = false,
  });

  final String label;
  final String value;
  final String helper;
  final MiniloStatTrend trend;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final helperColor = switch (trend) {
      MiniloStatTrend.up => minilo.colors.success,
      MiniloStatTrend.down => const Color(0xFFB91C1C),
      MiniloStatTrend.flat => const Color(0xFF6B7280),
    };

    return MiniloSurface(
      padding: EdgeInsets.all(minilo.spacing.s4),
      borderRadius: BorderRadius.circular(minilo.radius.md),
      child: loading
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MiniloShimmerBox(width: 130, height: 12),
                SizedBox(height: 12),
                MiniloShimmerBox(width: 150, height: 30),
                SizedBox(height: 12),
                MiniloShimmerBox(width: 180, height: 12),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: minilo.colors.textMuted),
                ),
                SizedBox(height: minilo.spacing.s2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: minilo.colors.primary,
                        height: 1.1,
                      ),
                ),
                SizedBox(height: minilo.spacing.s2),
                Text(
                  helper,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: helperColor),
                ),
              ],
            ),
    );
  }
}
