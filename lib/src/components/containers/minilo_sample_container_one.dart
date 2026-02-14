import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloSampleContainerOne extends StatelessWidget {
  const MiniloSampleContainerOne({
    super.key,
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    Widget infoRow(String label, String value) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: minilo.spacing.s2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: minilo.colors.text,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 343,
      padding: EdgeInsets.all(minilo.spacing.s4),
      decoration: BoxDecoration(
        color: minilo.colors.surface,
        border: Border.all(color: minilo.colors.border),
        borderRadius: BorderRadius.circular(minilo.radius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLoading)
            const MiniloShimmerBox(width: 55, height: 16)
          else
            Text(
              'Details',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          SizedBox(height: minilo.spacing.s3),
          if (isLoading)
            const MiniloShimmerBox(height: 44)
          else
            const TextField(
                decoration: InputDecoration(hintText: 'Sample Input 1')),
          SizedBox(height: minilo.spacing.s2),
          if (isLoading)
            const MiniloShimmerBox(height: 44)
          else
            const TextField(
                decoration: InputDecoration(hintText: 'Sample Input 2')),
          SizedBox(height: minilo.spacing.s3),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(minilo.spacing.s3),
            decoration: BoxDecoration(
              color: minilo.colors.surfaceMuted,
              borderRadius: BorderRadius.circular(minilo.radius.sm),
              border: Border.all(color: minilo.colors.border),
            ),
            child: isLoading
                ? const Column(
                    children: [
                      MiniloShimmerBox(height: 12),
                      SizedBox(height: 8),
                      MiniloShimmerBox(height: 12),
                      SizedBox(height: 8),
                      MiniloShimmerBox(height: 12),
                    ],
                  )
                : Column(
                    children: [
                      infoRow('Lorem Ipsum', 'Lorem Ipsum'),
                      infoRow('ELorem Ipsum', 'Lorem Ipsum'),
                      infoRow('Lorem Ipsum', 'Lorem Ipsum'),
                      infoRow('Lorem Ipsum', 'Lorem Ipsum'),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
