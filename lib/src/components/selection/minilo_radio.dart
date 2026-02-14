import 'package:flutter/material.dart';

class MiniloRadio extends StatelessWidget {
  const MiniloRadio({
    super.key,
    required this.selected,
    this.onChanged,
    this.size = 20,
    this.enabled = true,
  });

  final bool selected;
  final ValueChanged<bool>? onChanged;
  final double size;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final interactive = enabled && onChanged != null;

    return InkWell(
      onTap: interactive ? () => onChanged?.call(!selected) : null,
      borderRadius: BorderRadius.circular(size),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFEFE),
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? const Color(0xFF003078) : const Color(0xFFB1B4B6),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          width: size * 0.6,
          height: size * 0.6,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF003078) : const Color(0xFFF3F2F1),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
