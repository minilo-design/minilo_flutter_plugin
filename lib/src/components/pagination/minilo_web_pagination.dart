import 'package:flutter/material.dart';

class MiniloWebPagination extends StatelessWidget {
  const MiniloWebPagination({
    super.key,
    required this.page,
    required this.totalPages,
    required this.pageSize,
    required this.totalItems,
    this.pageSizeOptions = const <int>[6, 10, 25],
    this.onPageChanged,
    this.onPageSizeChanged,
  });

  final int page;
  final int totalPages;
  final int pageSize;
  final int totalItems;
  final List<int> pageSizeOptions;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onPageSizeChanged;

  @override
  Widget build(BuildContext context) {
    final start = ((page - 1) * pageSize) + 1;
    final end = (page * pageSize) > totalItems ? totalItems : (page * pageSize);

    List<int> visiblePages() {
      if (totalPages <= 4) {
        return List<int>.generate(totalPages, (i) => i + 1);
      }
      final base = (page - 1).clamp(1, totalPages - 3);
      return List<int>.generate(4, (i) => base + i);
    }

    Widget pageButton({
      required Widget child,
      required VoidCallback? onTap,
      required bool active,
      BorderRadius? borderRadius,
    }) {
      return SizedBox(
        width: 42,
        height: 42,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor:
                active ? const Color(0xFF003078) : const Color(0xFFFFFFFF),
            side: BorderSide(
              color: active ? const Color(0xFF003078) : const Color(0xFFB1B4B6),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.zero,
            ),
          ),
          child: child,
        ),
      );
    }

    return SizedBox(
      height: 42,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 1097,
          height: 42,
          child: Row(
            children: [
              SizedBox(
                width: 296,
                height: 42,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(color: const Color(0xFFB1B4B6)),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0D000000),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Row(
                        children: [
                          Text(
                            '$pageSize',
                            style: const TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 16,
                              height: 24 / 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF003078),
                            ),
                          ),
                          const Spacer(),
                          PopupMenuButton<int>(
                            tooltip: '',
                            onSelected: onPageSizeChanged,
                            itemBuilder: (_) {
                              return pageSizeOptions
                                  .map(
                                    (size) => PopupMenuItem<int>(
                                      value: size,
                                      child: Text('$size'),
                                    ),
                                  )
                                  .toList();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFB1B4B6),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$start-$end of $totalItems',
                      style: const TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        height: 24 / 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF003078),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 247,
                height: 42,
                child: Row(
                  children: [
                    pageButton(
                      active: false,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                      ),
                      onTap:
                          page > 1 ? () => onPageChanged?.call(page - 1) : null,
                      child: const Icon(
                        Icons.chevron_left,
                        color: Color(0xFFB1B4B6),
                        size: 16,
                      ),
                    ),
                    ...visiblePages().map(
                      (value) => pageButton(
                        active: value == page,
                        onTap: () => onPageChanged?.call(value),
                        child: Text(
                          '$value',
                          style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 14,
                            height: 24 / 14,
                            fontWeight: FontWeight.w400,
                            color: value == page
                                ? const Color(0xFFFFFFFF)
                                : const Color(0xFF003078),
                          ),
                        ),
                      ),
                    ),
                    pageButton(
                      active: false,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      onTap: page < totalPages
                          ? () => onPageChanged?.call(page + 1)
                          : null,
                      child: Icon(
                        Icons.chevron_right,
                        color: page < totalPages
                            ? const Color(0xFF003078)
                            : const Color(0xFFB1B4B6),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
