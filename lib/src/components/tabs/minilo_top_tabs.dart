import 'package:flutter/material.dart';

class MiniloTopTabs extends StatelessWidget {
  const MiniloTopTabs({
    super.key,
    required this.tabs,
    required this.currentIndex,
    this.onTap,
    this.activeWidth = 126,
    this.inactiveWidth = 147,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final double activeWidth;
  final double inactiveWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(tabs.length, (index) {
        final active = index == currentIndex;
        return InkWell(
          onTap: () => onTap?.call(index),
          child: Container(
            width: active ? activeWidth : inactiveWidth,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: active ? const Color(0x1A003078) : const Color(0xFFFFFEFE),
              border: Border(
                bottom: BorderSide(
                  color: active
                      ? const Color(0xFF003078)
                      : const Color(0xFFF3F2F1),
                  width: active ? 2 : 1,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              tabs[index],
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
