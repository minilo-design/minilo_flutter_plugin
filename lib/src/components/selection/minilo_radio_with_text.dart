import 'package:flutter/material.dart';

import 'minilo_radio.dart';

class MiniloRadioWithText<T> extends StatelessWidget {
  const MiniloRadioWithText({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.enabled = true,
  });

  final String label;
  final T value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: enabled ? () => onChanged?.call(value) : null,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MiniloRadio(
              selected: isSelected,
              onChanged: enabled ? (_) => onChanged?.call(value) : null,
              enabled: enabled,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 14,
                height: 24 / 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF383F43),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
