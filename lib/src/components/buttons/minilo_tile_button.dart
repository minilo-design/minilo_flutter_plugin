import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloTileButton extends StatelessWidget {
  const MiniloTileButton({
    super.key,
    required this.label,
    this.onTap,
    this.leading,
    this.enabled = true,
    this.loading = false,
    this.width,
    this.height = 64,
  });

  final String label;
  final VoidCallback? onTap;
  final Widget? leading;
  final bool enabled;
  final bool loading;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final interactive = enabled && !loading && onTap != null;

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: enabled
            ? minilo.colors.surface
            : minilo.colors.surface.withValues(alpha: 0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(minilo.radius.md),
          side: BorderSide(color: minilo.colors.border),
        ),
        child: InkWell(
          onTap: interactive ? onTap : null,
          borderRadius: BorderRadius.circular(minilo.radius.md),
          child: Padding(
            padding: EdgeInsets.all(minilo.spacing.s3),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: minilo.colors.secondarySoft,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: loading
                        ? MiniloShimmerBox(
                            width: 24,
                            height: 24,
                            radius: 12,
                          )
                        : (leading ??
                            Icon(Icons.insert_drive_file_outlined,
                                color: minilo.colors.primary)),
                  ),
                ),
                SizedBox(width: minilo.spacing.s3),
                Expanded(
                  child: loading
                      ? MiniloShimmerBox(height: 20, radius: minilo.radius.sm)
                      : Text(
                          label,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: minilo.colors.text,
                                  ),
                        ),
                ),
                SizedBox(width: minilo.spacing.s3),
                loading
                    ? MiniloShimmerBox(width: 20, height: 20, radius: 10)
                    : Icon(Icons.chevron_right_rounded,
                        color: minilo.colors.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
