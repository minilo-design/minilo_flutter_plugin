import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';

class MiniloSecondaryButton extends StatelessWidget {
  const MiniloSecondaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.enabled = true,
    this.loading = false,
    this.width = 136,
    this.height = 52,
    this.horizontalPadding = 16,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;
  final bool enabled;
  final bool loading;
  final double width;
  final double height;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final interactive = enabled && !loading && onPressed != null;

    final foreground =
        enabled ? const Color(0xFF003078) : const Color(0xFFB1B4B6);

    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: interactive ? onPressed : null,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: foreground),
          backgroundColor: const Color(0xFFFFFEFE),
          disabledBackgroundColor: const Color(0xFFFFFEFE),
          foregroundColor: foreground,
          disabledForegroundColor: foreground,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w700,
              ),
        ),
        child: loading
            ? MiniloShimmerBox(
                width: 84,
                height: 24,
                radius: 4,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    SizedBox.square(
                      dimension: 24,
                      child: IconTheme(
                        data: IconThemeData(color: foreground, size: 24),
                        child: icon!,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
