import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

@immutable
class MiniloPieSlice {
  const MiniloPieSlice({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final double value;
  final Color color;
}

class MiniloPieChartCard extends StatelessWidget {
  const MiniloPieChartCard({
    super.key,
    required this.title,
    required this.slices,
    this.size = 160,
  });

  final String title;
  final List<MiniloPieSlice> slices;
  final double size;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final total = slices.fold<double>(0, (sum, item) => sum + item.value);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: minilo.colors.surface,
        borderRadius: BorderRadius.circular(minilo.radius.md),
        border: Border.all(color: minilo.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: minilo.colors.primary,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: CustomPaint(
                  painter: _MiniloPiePainter(slices: slices, total: total),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: slices
                      .map(
                        (slice) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: slice.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  '${slice.label} (${slice.value.toStringAsFixed(0)})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: minilo.colors.text),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniloPiePainter extends CustomPainter {
  const _MiniloPiePainter({
    required this.slices,
    required this.total,
  });

  final List<MiniloPieSlice> slices;
  final double total;

  @override
  void paint(Canvas canvas, Size size) {
    if (slices.isEmpty || total <= 0) {
      return;
    }

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    var startAngle = -math.pi / 2;

    for (final slice in slices) {
      final sweepAngle = (slice.value / total) * math.pi * 2;
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = slice.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
    }

    final cutoutPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius * 0.55, cutoutPaint);
  }

  @override
  bool shouldRepaint(covariant _MiniloPiePainter oldDelegate) {
    return oldDelegate.slices != slices || oldDelegate.total != total;
  }
}
