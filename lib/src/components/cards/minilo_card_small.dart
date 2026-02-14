import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_surface.dart';
import '../../foundation/minilo_theme.dart';

class MiniloCardSmall extends StatelessWidget {
  const MiniloCardSmall({
    super.key,
    required this.headline,
    required this.text,
    this.icon,
    this.actionLabel = 'Apply Now',
    this.onTap,
    this.loading = false,
    this.width,
    this.height,
  });

  final String headline;
  final String text;
  final Widget? icon;
  final String actionLabel;
  final VoidCallback? onTap;
  final bool loading;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return SizedBox(
      width: width ?? 194,
      height: height,
      child: MiniloSurface(
        padding: EdgeInsets.all(minilo.spacing.s3),
        borderRadius: BorderRadius.circular(minilo.radius.md),
        color: minilo.colors.surface,
        child: InkWell(
          borderRadius: BorderRadius.circular(minilo.radius.md),
          onTap: loading ? null : onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: minilo.colors.surfaceMuted,
                  shape: BoxShape.circle,
                  border: Border.all(color: minilo.colors.primary),
                ),
                child: loading
                    ? const MiniloShimmerBox(width: 32, height: 32, radius: 16)
                    : Center(
                        child: icon ??
                            Icon(Icons.star_border,
                                size: 18, color: minilo.colors.primary)),
              ),
              SizedBox(height: minilo.spacing.s2),
              if (loading)
                const MiniloShimmerBox(width: 130, height: 16)
              else
                Text(
                  headline,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: minilo.colors.text),
                ),
              SizedBox(height: minilo.spacing.s2),
              if (loading)
                const MiniloShimmerBox(width: double.infinity, height: 12)
              else
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              SizedBox(height: minilo.spacing.s4),
              if (loading)
                const MiniloShimmerBox(width: 80, height: 18)
              else
                Text(
                  actionLabel,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: minilo.colors.primary),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
