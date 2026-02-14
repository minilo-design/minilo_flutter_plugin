import 'package:flutter/material.dart';

import 'minilo_app_bar.dart';

class MiniloAppBarAlt extends StatelessWidget {
  const MiniloAppBarAlt({
    super.key,
    this.title = 'My Profile',
    this.timeText = '9:41',
    this.onBack,
  });

  final String title;
  final String timeText;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return MiniloAppBar(
      title: title,
      timeText: timeText,
      onBack: onBack,
      showBack: true,
    );
  }
}
