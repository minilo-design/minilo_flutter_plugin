import 'package:flutter/material.dart';

@immutable
class MiniloNavBarItem {
  const MiniloNavBarItem(
      {required this.icon, required this.label, this.activeIcon});

  final Widget icon;
  final String label;
  final Widget? activeIcon;
}

class MiniloBottomNavBar extends StatelessWidget {
  const MiniloBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<MiniloNavBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  factory MiniloBottomNavBar.defaultTabs({
    Key? key,
    required int currentIndex,
    required ValueChanged<int> onTap,
  }) {
    return MiniloBottomNavBar(
      key: key,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        MiniloNavBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        MiniloNavBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: 'Search',
        ),
        MiniloNavBarItem(
          icon: Icon(Icons.grid_view_outlined),
          activeIcon: Icon(Icons.grid_view),
          label: 'Apps',
        ),
        MiniloNavBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: () => onTap(index),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconTheme(
                      data: IconThemeData(
                        size: 20,
                        color: active
                            ? const Color(0xFF003078)
                            : const Color(0xFF6B7280),
                      ),
                      child:
                          active ? (item.activeIcon ?? item.icon) : item.icon,
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
