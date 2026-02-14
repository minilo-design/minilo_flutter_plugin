import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloItemCard extends StatelessWidget {
  const MiniloItemCard({
    super.key,
    this.title = 'Item Name',
    this.fromDate = '12 Jan 2024',
    this.toDate = '15 Jan 2024',
    this.duration = '03 days',
    this.loading = false,
    this.onEdit,
    this.onDelete,
  });

  final String title;
  final String fromDate;
  final String toDate;
  final String duration;
  final bool loading;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    Widget actionButton({
      required IconData icon,
      required String label,
      required Color color,
      required VoidCallback? onTap,
    }) {
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: loading ? null : onTap,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: minilo.colors.border),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 16, color: color),
                SizedBox(width: minilo.spacing.s2),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: 323,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              color: minilo.colors.surface,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFF3F2F1)),
            ),
            padding: EdgeInsets.fromLTRB(minilo.spacing.s4, minilo.spacing.s3,
                minilo.spacing.s4, minilo.spacing.s3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (loading)
                  const MiniloShimmerBox(width: 120, height: 16)
                else
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: minilo.colors.primary),
                  ),
                SizedBox(height: minilo.spacing.s1),
                if (loading)
                  const MiniloShimmerBox(width: 220, height: 14)
                else
                  Text(
                    'From Date : $fromDate',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF666666),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                if (loading)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: MiniloShimmerBox(width: 220, height: 14),
                  )
                else
                  Text(
                    'To Date : $toDate',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF666666),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                SizedBox(height: minilo.spacing.s4),
                Row(
                  children: [
                    if (loading)
                      const Expanded(child: MiniloShimmerBox(height: 44))
                    else
                      actionButton(
                        icon: Icons.edit_outlined,
                        label: 'Edit',
                        color: minilo.colors.primary,
                        onTap: onEdit,
                      ),
                    SizedBox(width: minilo.spacing.s3),
                    if (loading)
                      const Expanded(child: MiniloShimmerBox(height: 44))
                    else
                      actionButton(
                        icon: Icons.delete_outline,
                        label: 'Delete',
                        color: const Color(0xFFD4351C),
                        onTap: onDelete,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 24,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: minilo.colors.primary,
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
              height: 20,
              padding: EdgeInsets.symmetric(horizontal: minilo.spacing.s3),
              decoration: BoxDecoration(
                color: minilo.colors.successSoft,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
              child: loading
                  ? const MiniloShimmerBox(width: 52, height: 12)
                  : Center(
                      child: Text(
                        duration,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: minilo.colors.success,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
