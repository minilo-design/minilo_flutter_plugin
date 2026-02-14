import 'package:flutter/material.dart';

class MiniloTabPills extends StatelessWidget {
  const MiniloTabPills({
    super.key,
    required this.tabs,
    required this.currentIndex,
    this.onTap,
    this.activeWidth = 124,
    this.inactiveWidth = 147,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final double activeWidth;
  final double inactiveWidth;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List<Widget>.generate(tabs.length, (index) {
        final active = currentIndex == index;
        return InkWell(
          onTap: () => onTap?.call(index),
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: active ? activeWidth : inactiveWidth,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: active ? const Color(0xFFE6EAF2) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              tabs[index],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w500,
                color:
                    active ? const Color(0xFF003078) : const Color(0xFF383F43),
              ),
            ),
          ),
        );
      }),
    );
  }
}
