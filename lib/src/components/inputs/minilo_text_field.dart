import 'package:flutter/material.dart';

class MiniloTextField extends StatelessWidget {
  const MiniloTextField({
    super.key,
    this.label = 'Label name',
    this.controller,
    this.placeholder,
    this.enabled = true,
    this.active = false,
    this.showRequiredMark = false,
    this.keyboardType,
    this.onChanged,
    this.width = 343,
    this.height = 52,
    this.trailing,
  });

  final String label;
  final TextEditingController? controller;
  final String? placeholder;
  final bool enabled;
  final bool active;
  final bool showRequiredMark;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final double width;
  final double height;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final borderColor = active
        ? const Color(0xFF003078)
        : (enabled ? const Color(0xFFB1B4B6) : const Color(0xFFC1C1C2));

    final labelColor = active
        ? const Color(0xFF003078)
        : (enabled ? const Color(0xFF383F43) : const Color(0xFFA2A3A4));

    final textColor =
        enabled ? const Color(0xFF383F43) : const Color(0xFFB1B4B6);

    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: height,
            child: TextField(
              controller: controller,
              enabled: enabled,
              keyboardType: keyboardType,
              onChanged: onChanged,
              style: TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 14,
                height: 24 / 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontFamily: 'Noto Sans',
                  fontSize: 14,
                  height: 24 / 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF7A7E81),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                filled: true,
                fillColor: const Color(0xFFFFFEFE),
                suffixIcon: trailing,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Color(0xFF003078)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Color(0xFFC1C1C2)),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: -12,
            child: Container(
              color: const Color(0xFFFFFEFE),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                showRequiredMark ? '$label *' : label,
                style: TextStyle(
                  fontFamily: 'Noto Sans',
                  fontSize: 12,
                  height: 24 / 12,
                  fontWeight: FontWeight.w400,
                  color: labelColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
