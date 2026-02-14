import 'package:flutter/material.dart';

@immutable
class MiniloBreadcrumbItem {
  const MiniloBreadcrumbItem({
    required this.label,
    this.onTap,
    this.isCurrent = false,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isCurrent;
}

class MiniloBreadcrumbs extends StatelessWidget {
  const MiniloBreadcrumbs({
    super.key,
    required this.items,
    this.showHomeBox = true,
  });

  final List<MiniloBreadcrumbItem> items;
  final bool showHomeBox;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> children = [];

    if (showHomeBox) {
      children.add(
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(color: const Color(0xFFF3F2F1)),
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.home_outlined,
              size: 20, color: Color(0xFF003078)),
        ),
      );
      children.add(
          const Icon(Icons.chevron_right, size: 16, color: Color(0xFF383F43)));
    }

    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final isLast = i == items.length - 1 || item.isCurrent;

      children.add(
        InkWell(
          onTap: isLast ? null : item.onTap,
          child: Text(
            item.label,
            style: TextStyle(
              fontFamily: 'Noto Sans',
              fontSize: 12,
              height: 2,
              fontWeight: isLast ? FontWeight.w500 : FontWeight.w400,
              color: isLast ? const Color(0xFF003078) : const Color(0xFF383F43),
            ),
          ),
        ),
      );

      if (!isLast) {
        children.add(
          const Icon(Icons.chevron_right, size: 16, color: Color(0xFF383F43)),
        );
      }
    }

    return SizedBox(
      width: 189,
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children
            .map((widget) => Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: widget,
                ))
            .toList(),
      ),
    );
  }
}
