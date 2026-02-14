import 'package:flutter/material.dart';

import 'minilo_theme.dart';

class MiniloShimmerBox extends StatefulWidget {
  const MiniloShimmerBox({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.baseColor,
    this.highlightColor,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  State<MiniloShimmerBox> createState() => _MiniloShimmerBoxState();
}

class _MiniloShimmerBoxState extends State<MiniloShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final base = widget.baseColor ?? minilo.colors.border;
    final highlight = widget.highlightColor ?? minilo.colors.surfaceMuted;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final dx = (_controller.value * 2) - 1;
          return ClipRRect(
            borderRadius:
                BorderRadius.circular(widget.radius ?? minilo.radius.sm),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ColoredBox(color: base),
                Align(
                  alignment: Alignment(dx, 0),
                  child: FractionallySizedBox(
                    widthFactor: 0.55,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            highlight.withValues(alpha: 0),
                            highlight,
                            highlight.withValues(alpha: 0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
