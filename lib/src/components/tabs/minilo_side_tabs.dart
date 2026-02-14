import 'package:flutter/material.dart';

enum MiniloSideTabState {
  active,
  inactive,
}

enum MiniloSideTabIconState {
  none,
  checked,
  unchecked,
}

@immutable
class MiniloSideTabItemData {
  const MiniloSideTabItemData({
    required this.label,
    this.state = MiniloSideTabState.inactive,
    this.iconState = MiniloSideTabIconState.none,
  });

  final String label;
  final MiniloSideTabState state;
  final MiniloSideTabIconState iconState;
}

class MiniloSideTabs extends StatelessWidget {
  const MiniloSideTabs({
    super.key,
    required this.items,
    this.onTap,
    this.widthWithIcon = 205,
    this.widthWithoutIcon = 177,
  });

  final List<MiniloSideTabItemData> items;
  final ValueChanged<int>? onTap;
  final double widthWithIcon;
  final double widthWithoutIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(items.length, (index) {
        final item = items[index];
        final hasIcon = item.iconState != MiniloSideTabIconState.none;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _MiniloSideTabItem(
            width: hasIcon ? widthWithIcon : widthWithoutIcon,
            data: item,
            onTap: () => onTap?.call(index),
          ),
        );
      }),
    );
  }
}

class _MiniloSideTabItem extends StatelessWidget {
  const _MiniloSideTabItem({
    required this.width,
    required this.data,
    this.onTap,
  });

  final double width;
  final MiniloSideTabItemData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = data.state == MiniloSideTabState.active;

    final bgColor =
        isActive ? const Color(0xFFF5F4F4) : const Color(0xFFFFFEFE);
    final textColor =
        isActive ? const Color(0xFF003078) : const Color(0xFF383F43);

    Widget? icon;
    switch (data.iconState) {
      case MiniloSideTabIconState.none:
        icon = null;
      case MiniloSideTabIconState.checked:
        icon =
            const Icon(Icons.check_circle, size: 20, color: Color(0xFF005A30));
      case MiniloSideTabIconState.unchecked:
        icon = const Icon(Icons.radio_button_unchecked,
            size: 20, color: Color(0xFFB1B4B6));
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: width,
        height: 64,
        padding: EdgeInsets.fromLTRB(
          isActive ? 12 : 16,
          20,
          16,
          20,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
          border: Border(
            left: BorderSide(
              color: isActive ? const Color(0xFF003078) : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                data.label,
                style: TextStyle(
                  fontFamily: 'Noto Sans',
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
