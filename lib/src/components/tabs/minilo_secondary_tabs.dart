import 'package:flutter/material.dart';

import 'minilo_tab_pills.dart';

class MiniloSecondaryTabs extends StatelessWidget {
  const MiniloSecondaryTabs({
    super.key,
    required this.tabs,
    required this.currentIndex,
    this.onTap,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return MiniloTabPills(
      tabs: tabs,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
