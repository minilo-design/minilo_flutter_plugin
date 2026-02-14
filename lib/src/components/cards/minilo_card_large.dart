import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../buttons/minilo_primary_button.dart';
import '../buttons/minilo_secondary_button.dart';
import 'minilo_card_models.dart';

class MiniloCardLarge extends StatelessWidget {
  const MiniloCardLarge({
    super.key,
    this.title = 'Candidate Profile',
    this.details = const <MiniloCardDetail>[],
    this.status = 'Status',
    this.statusTextColor = const Color(0xFF005A30),
    this.statusBackgroundColor = const Color(0x33005A30),
    this.isLoading = false,
    this.primaryActionLabel = 'Approve',
    this.secondaryActionLabel = 'Add New Candidate',
    this.onPrimaryAction,
    this.onSecondaryAction,
    this.width = 343,
    this.showActions = true,
  });

  final String title;
  final List<MiniloCardDetail> details;
  final String status;
  final Color statusTextColor;
  final Color statusBackgroundColor;
  final bool isLoading;
  final String primaryActionLabel;
  final String secondaryActionLabel;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  final double width;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    final rows = isLoading ? 6 : details.length;

    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEEEFF0)),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: statusBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 15,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  status,
                  style: TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 12,
                    height: 24 / 12,
                    fontWeight: FontWeight.w600,
                    color: statusTextColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isLoading)
                    const MiniloShimmerBox(width: 190, height: 24, radius: 4)
                  else
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 14,
                        height: 24 / 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF003078),
                      ),
                    ),
                  const SizedBox(height: 12),
                  ...List<Widget>.generate(rows, (index) {
                    if (isLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: MiniloShimmerBox(
                            width: double.infinity, height: 16),
                      );
                    }

                    final detail = details[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              detail.label,
                              style: const TextStyle(
                                fontFamily: 'Noto Sans',
                                fontSize: 14,
                                height: 24 / 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              detail.value,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontFamily: 'Noto Sans',
                                fontSize: 14,
                                height: 24 / 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  if (showActions) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: isLoading
                              ? const MiniloShimmerBox(height: 48, radius: 4)
                              : MiniloSecondaryButton(
                                  label: secondaryActionLabel,
                                  onPressed: onSecondaryAction,
                                  width: double.infinity,
                                  height: 48,
                                ),
                        ),
                        const SizedBox(width: 23),
                        Expanded(
                          child: isLoading
                              ? const MiniloShimmerBox(height: 48, radius: 4)
                              : MiniloPrimaryButton(
                                  label: primaryActionLabel,
                                  onPressed: onPrimaryAction,
                                  width: double.infinity,
                                  height: 48,
                                ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
