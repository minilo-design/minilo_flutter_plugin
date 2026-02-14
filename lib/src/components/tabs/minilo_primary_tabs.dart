import 'package:flutter/material.dart';

import 'minilo_top_tabs.dart';

class MiniloPrimaryTabs extends StatelessWidget {
  const MiniloPrimaryTabs({
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
    return MiniloTopTabs(
      tabs: tabs,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
