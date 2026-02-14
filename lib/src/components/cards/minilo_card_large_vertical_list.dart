import 'package:flutter/material.dart';

@immutable
class MiniloVerticalListItem {
  const MiniloVerticalListItem({
    required this.title,
    required this.lines,
    required this.status,
    this.statusColor,
    this.leadingStripeColor,
  });

  final String title;
  final List<String> lines;
  final String status;
  final Color? statusColor;
  final Color? leadingStripeColor;
}

class MiniloCardLargeVerticalList extends StatelessWidget {
  const MiniloCardLargeVerticalList({
    super.key,
    required this.item,
    this.onApprove,
    this.onReject,
    this.approveLabel = 'Edit',
    this.rejectLabel = 'Delete',
    this.width = 323,
  });

  final MiniloVerticalListItem item;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;
  final String approveLabel;
  final String rejectLabel;
  final double width;

  @override
  Widget build(BuildContext context) {
    final statusColor = item.statusColor ?? const Color(0xFF005A30);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFF3F2F1)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 24,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: item.leadingStripeColor ?? const Color(0xFF003078),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 24,
            child: Container(
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                item.status,
                style: TextStyle(
                  fontFamily: 'Noto Sans',
                  fontSize: 12,
                  height: 24 / 12,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 14,
                    height: 24 / 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF003078),
                  ),
                ),
                const SizedBox(height: 8),
                ...item.lines.map(
                  (line) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      line,
                      style: const TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        height: 24 / 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 4,
                  children: [
                    TextButton.icon(
                      onPressed: onApprove,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                      icon: const Icon(Icons.edit_outlined,
                          size: 15, color: Color(0xFF003078)),
                      label: Text(
                        approveLabel,
                        style: const TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          height: 24 / 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF003078),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: onReject,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                      icon: const Icon(Icons.delete_outline,
                          size: 17, color: Color(0xFFD4351C)),
                      label: Text(
                        rejectLabel,
                        style: const TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 14,
                          height: 24 / 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD4351C),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
