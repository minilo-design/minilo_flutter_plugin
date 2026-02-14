import 'package:flutter/material.dart';

@immutable
class MiniloFilterChipItem {
  const MiniloFilterChipItem({
    required this.label,
    this.count,
    this.selected = false,
  });

  final String label;
  final int? count;
  final bool selected;

  MiniloFilterChipItem copyWith({
    String? label,
    int? count,
    bool? selected,
  }) {
    return MiniloFilterChipItem(
      label: label ?? this.label,
      count: count ?? this.count,
      selected: selected ?? this.selected,
    );
  }
}

class MiniloFilterChips extends StatelessWidget {
  const MiniloFilterChips({
    super.key,
    required this.items,
    this.onTap,
  });

  final List<MiniloFilterChipItem> items;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    const widths = <double>[65, 105, 96, 96];

    return SizedBox(
      width: 386,
      height: 28,
      child: Row(
        children: List<Widget>.generate(items.length, (index) {
          final item = items[index];
          final isSelected = item.selected;
          final width = index < widths.length ? widths[index] : 96.0;

          return SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: InkWell(
                onTap: () => onTap?.call(index),
                borderRadius: BorderRadius.circular(54),
                child: Container(
                  height: 28,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0x33003078)
                        : const Color(0x33B1B4B6),
                    borderRadius: BorderRadius.circular(54),
                  ),
                  child: Row(
                    children: [
                      if (item.count != null)
                        Container(
                          constraints: const BoxConstraints(minWidth: 24),
                          height: 24,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF003078)
                                : const Color(0xFFB1B4B6),
                            borderRadius: BorderRadius.circular(54),
                          ),
                          child: Text(
                            item.count.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 12,
                              height: 24 / 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      if (item.count != null) const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 12,
                            height: 24 / 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? const Color(0xFF003078)
                                : const Color(0xFFB1B4B6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
