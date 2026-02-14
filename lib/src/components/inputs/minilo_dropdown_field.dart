import 'package:flutter/material.dart';

@immutable
class MiniloDropdownOption<T> {
  const MiniloDropdownOption({required this.value, required this.label});

  final T value;
  final String label;
}

class MiniloDropdownField<T> extends StatelessWidget {
  const MiniloDropdownField({
    super.key,
    this.label = 'Label name',
    this.placeholder = 'Select option',
    required this.options,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.width = 343,
  });

  final String label;
  final String placeholder;
  final List<MiniloDropdownOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 12,
                height: 24 / 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF383F43),
              ),
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<T>(
            // ignore: deprecated_member_use
            value: value,
            onChanged: enabled ? onChanged : null,
            style: const TextStyle(
              fontFamily: 'Noto Sans',
              fontSize: 14,
              height: 24 / 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF383F43),
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              filled: true,
              fillColor: const Color(0xFFFFFEFE),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Color(0xFFB1B4B6)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Color(0xFFC1C1C2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Color(0xFF003078)),
              ),
            ),
            hint: Text(
              placeholder,
              style: const TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 14,
                height: 24 / 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7A7E81),
              ),
            ),
            items: options
                .map(
                  (option) => DropdownMenuItem<T>(
                    value: option.value,
                    child: Text(option.label),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
