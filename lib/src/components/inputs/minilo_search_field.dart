import 'package:flutter/material.dart';

import '../search/minilo_search_mobile.dart';

class MiniloSearchField extends StatelessWidget {
  const MiniloSearchField({
    super.key,
    this.placeholder = 'Search...',
    this.controller,
    this.onChanged,
    this.onSearchTap,
    this.onMicTap,
    this.onClearTap,
    this.active = false,
  });

  final String placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMicTap;
  final VoidCallback? onClearTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return MiniloSearchMobile(
      state: active
          ? MiniloSearchMobileState.typing
          : MiniloSearchMobileState.defaultState,
      controller: controller,
      hintText: placeholder,
      onChanged: onChanged,
      onClear: onClearTap,
      onVoiceTap: onMicTap,
    );
  }
}
