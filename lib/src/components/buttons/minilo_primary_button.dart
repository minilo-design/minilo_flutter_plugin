import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloPrimaryButton extends StatelessWidget {
  const MiniloPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.enabled = true,
    this.loading = false,
    this.width = 136,
    this.height = 52,
    this.horizontalPadding = 16,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool loading;
  final double width;
  final double height;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final interactive = enabled && !loading && onPressed != null;
    final verticalPadding = ((height - 24) / 2).clamp(0.0, 999.0);

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: interactive ? onPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF003078),
            disabledBackgroundColor: const Color(0xFF003078),
            foregroundColor: minilo.colors.white,
            disabledForegroundColor: minilo.colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  color: minilo.colors.white,
                ),
          ),
          child: loading
              ? MiniloShimmerBox(
                  width: 84,
                  height: 24,
                  radius: 4,
                  baseColor: minilo.colors.white.withValues(alpha: 0.22),
                  highlightColor: minilo.colors.white.withValues(alpha: 0.45),
                )
              : Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
