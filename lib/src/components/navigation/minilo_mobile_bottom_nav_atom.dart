import 'package:flutter/material.dart';

@immutable
class MiniloMobileBottomNavAtomItem {
  const MiniloMobileBottomNavAtomItem({
    required this.icon,
    required this.label,
    this.activeIcon,
  });

  final IconData icon;
  final IconData? activeIcon;
  final String label;
}

class MiniloMobileBottomNavAtom extends StatelessWidget {
  const MiniloMobileBottomNavAtom({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onTap,
  });

  final List<MiniloMobileBottomNavAtomItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 56,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border(top: BorderSide(color: Color(0xFFF3F2F1))),
      ),
      child: Row(
        children: List<Widget>.generate(items.length, (index) {
          final item = items[index];
          final active = index == currentIndex;
          return Expanded(
            child: InkWell(
              onTap: () => onTap?.call(index),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      active ? (item.activeIcon ?? item.icon) : item.icon,
                      size: 20,
                      color: active
                          ? const Color(0xFF003078)
                          : const Color(0xFF6B7280),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 10,
                        height: 12 / 10,
                        fontWeight: FontWeight.w500,
                        color: active
                            ? const Color(0xFF003078)
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
