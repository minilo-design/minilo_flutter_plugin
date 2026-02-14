import 'package:flutter/material.dart';

class MiniloCheckbox extends StatelessWidget {
  const MiniloCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 20,
    this.enabled = true,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final double size;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final interactive = enabled && onChanged != null;

    return InkWell(
      onTap: interactive ? () => onChanged?.call(!value) : null,
      borderRadius: BorderRadius.circular(4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: value ? const Color(0xFF003078) : const Color(0xFFF3F2F1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: value ? const Color(0xFF5A97F8) : const Color(0xFFB1B4B6),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: value
            ? Icon(
                Icons.check,
                size: size * 0.8,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
