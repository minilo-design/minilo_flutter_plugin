import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_surface.dart';
import '../../foundation/minilo_theme.dart';

class MiniloCardXs extends StatelessWidget {
  const MiniloCardXs({
    super.key,
    required this.title,
    required this.subtitle,
    this.timeAgo = '10 hours ago',
    this.ctaLabel = 'See Now',
    this.image,
    this.loading = false,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String timeAgo;
  final String ctaLabel;
  final Widget? image;
  final bool loading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return MiniloSurface(
      padding: EdgeInsets.all(minilo.spacing.s3),
      borderRadius: BorderRadius.circular(minilo.radius.md),
      child: InkWell(
        borderRadius: BorderRadius.circular(minilo.radius.md),
        onTap: loading ? null : onTap,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(minilo.radius.md),
                child: loading
                    ? const MiniloShimmerBox(width: 80, height: 80, radius: 8)
                    : (image ?? ColoredBox(color: minilo.colors.surfaceMuted)),
              ),
            ),
            SizedBox(width: minilo.spacing.s3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (loading)
                    const MiniloShimmerBox(width: 120, height: 16)
                  else
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: minilo.colors.text),
                    ),
                  SizedBox(height: minilo.spacing.s1),
                  if (loading)
                    const MiniloShimmerBox(width: 160, height: 12)
                  else
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            SizedBox(width: minilo.spacing.s2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (loading)
                  const MiniloShimmerBox(width: 74, height: 12)
                else
                  Text(
                    timeAgo,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: minilo.colors.black),
                  ),
                SizedBox(height: minilo.spacing.s1),
                if (loading)
                  const MiniloShimmerBox(width: 56, height: 12)
                else
                  Text(
                    ctaLabel,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: minilo.colors.primary),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
