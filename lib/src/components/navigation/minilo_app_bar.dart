import 'package:flutter/material.dart';

class MiniloAppBar extends StatelessWidget {
  const MiniloAppBar({
    super.key,
    this.title = 'Search',
    this.timeText = '9:41',
    this.onBack,
    this.showBack = true,
  });

  final String title;
  final String timeText;
  final VoidCallback? onBack;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    Widget statusIcon() {
      return Container(
        width: 17,
        height: 10.67,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(2),
        ),
      );
    }

    return SizedBox(
      width: 375,
      height: 100,
      child: Column(
        children: [
          Container(
            width: 375,
            height: 44,
            color: const Color(0xFF003078),
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeText,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Row(
                  children: [
                    statusIcon(),
                    const SizedBox(width: 8),
                    statusIcon(),
                    const SizedBox(width: 8),
                    Container(
                      width: 22,
                      height: 11.33,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0x59FFFFFF)),
                        borderRadius: BorderRadius.circular(2.66),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 375,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF003078),
              border: Border(
                bottom: BorderSide(color: Color(0xFFF3F2F1)),
              ),
            ),
            child: Row(
              children: [
                if (showBack)
                  IconButton(
                    onPressed: onBack,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                if (showBack) const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 18,
                    height: 24 / 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
