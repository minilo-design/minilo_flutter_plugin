import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloContainerCard extends StatelessWidget {
  const MiniloContainerCard({
    super.key,
    this.title = 'Title',
    this.content = 'Content goes here',
    this.isLoading = false,
  });

  final String title;
  final String content;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return Container(
      width: 343,
      height: 144,
      padding: EdgeInsets.all(minilo.spacing.s3),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFEFE),
        border: Border.all(color: const Color(0xFFF3F2F1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isLoading)
            const MiniloShimmerBox(width: 120, height: 18)
          else
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: minilo.colors.black,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          const Spacer(),
          if (isLoading)
            const MiniloShimmerBox(width: 180, height: 16)
          else
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF383F43),
                    fontWeight: FontWeight.w400,
                  ),
            ),
        ],
      ),
    );
  }
}
