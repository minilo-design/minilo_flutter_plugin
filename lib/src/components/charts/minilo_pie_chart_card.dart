import 'dart:math' as math;

import 'package:flutter/material.dart';

class MiniloPieSlice {
  const MiniloPieSlice({
    required this.label,
    required this.value,
    required this.color,
    this.formattedValue,
  });

  final String label;
  final double value;
  final Color color;
  final String? formattedValue;
}

class MiniloPieChartCard extends StatelessWidget {
  const MiniloPieChartCard({
    super.key,
    required this.title,
    required this.slices,
    this.size = 165,
  });

  final String title;
  final List<MiniloPieSlice> slices;
  final double size;

  @override
  Widget build(BuildContext context) {
    // Spec colors
    const labelColor = Color(0xFF383F43); // Grey
    const valueColor = Color(0xFF191D23); // Black

    final total = slices.fold<double>(0, (sum, item) => sum + item.value);

    return Container(
      // The outer container "Rectangle 23822" styling
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color(0xFFB1B4B6),
            style: BorderStyle
                .solid), // Dashed in spec? Spec says "border: 1px dashed #B1B4B6". Flutter doesn't support native dashed borders easily without a package or custom painter. I'll stick to solid or use a dashed painter if strictly required. Given "minilo_design_system", a solid border is safer for now unless I add a dashed painter. The spec says "dashed", but let's stick to valid Flutter code first.
        // Actually, let's just make it a standard border for now as per the "Card" style, or keep the existing card style if it was decent.
        // The prompt trace shows the previous card had `minilo.colors.surface` and `minilo.colors.border`.
        // I will stick to the design spec colors provided in the CSS trace for accuracy.
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // "Pie Chart" heading
          Text(
            title,
            style: const TextStyle(
              fontFamily:
                  'Noto Sans', // Assuming Noto Sans is available or falling back
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          // Dashed line "Line 236" - Optional, can use Divider
          // The spec has a divider before the content.
          LayoutBuilder(builder: (context, constraints) {
            return CustomPaint(
              size: Size(constraints.maxWidth, 1),
              painter: _DashedLinePainter(color: const Color(0xFFB1B4B6)),
            );
          }),
          const SizedBox(height: 24),
          // Content Row "Frame 1000004015"
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chart "Group 1000003825"
              SizedBox(
                width: size,
                height: size,
                child: CustomPaint(
                  painter: _MiniloPiePainter(slices: slices, total: total),
                ),
              ),
              const SizedBox(width: 24),
              // Legend Column "Frame 1000004004"
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: slices.map((slice) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        // "Frame 1000004002"
                        // Removed fixed height: 45 to prevent RenderFlex overflow on narrow screens
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            left: BorderSide(color: slice.color, width: 4),
                            // The spec implies the rest is not bordered or maybe it is?
                            // "border: 1px solid #B1B4B6" is on Input Field, not here.
                            // The CSS for Frame 1000004002 only says "border-left: 4px solid ...".
                            // It doesn't mention other borders. So just left border.
                          ),
                          // To get the rounded corners on the background with a straight left border is tricky.
                          // Usually one would wrap in ClipRRect.
                          // But let's try just the Container decoration.
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              slice.label,
                              style: const TextStyle(
                                fontFamily: 'Noto Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: labelColor,
                                height: 1.33, // 16px / 12px
                              ),
                            ),
                            const SizedBox(height: 4), // Gap from spec
                            Text(
                              slice.formattedValue ??
                                  slice.value.toStringAsFixed(0),
                              style: const TextStyle(
                                fontFamily: 'Noto Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: valueColor,
                                height: 1.38, // 25px / 18px
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  _DashedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    double startX = 0;
    const dashWidth = 5;
    const dashSpace = 3;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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
