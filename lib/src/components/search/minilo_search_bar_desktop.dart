import 'package:flutter/material.dart';

enum MiniloSearchBarDesktopState {
  defaultState,
  active,
}

class MiniloSearchBarDesktop extends StatelessWidget {
  const MiniloSearchBarDesktop({
    super.key,
    this.state = MiniloSearchBarDesktopState.defaultState,
    this.controller,
    this.hintText = 'Search',
    this.onChanged,
    this.onClear,
    this.width = 260,
  });

  final MiniloSearchBarDesktopState state;
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isActive = state == MiniloSearchBarDesktopState.active;

    return SizedBox(
      width: width,
      height: 48,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          fontFamily: 'Noto Sans',
          fontSize: 14,
          height: 24 / 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF383F43),
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          filled: true,
          fillColor: const Color(0xFFFFFEFE),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Noto Sans',
            fontSize: 14,
            height: 24 / 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF383F43),
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
            color: Color(0xFFB1B4B6),
          ),
          suffixIcon: isActive
              ? IconButton(
                  onPressed: onClear,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(
                    width: 20,
                    height: 20,
                  ),
                  visualDensity: VisualDensity.compact,
                  splashRadius: 12,
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                    color: Color(0xFF003078),
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color:
                  isActive ? const Color(0xFF003078) : const Color(0xFFB1B4B6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xFF003078)),
          ),
        ),
      ),
    );
  }
}
