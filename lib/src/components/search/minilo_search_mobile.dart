import 'package:flutter/material.dart';

enum MiniloSearchMobileState {
  defaultState,
  typing,
  typed,
}

class MiniloSearchMobile extends StatelessWidget {
  const MiniloSearchMobile({
    super.key,
    this.state = MiniloSearchMobileState.defaultState,
    this.controller,
    this.hintText = 'Search...',
    this.recentTitle = 'Recently Searched',
    this.popularTitle = 'Popular Search',
    this.recentSearches = const <String>[],
    this.popularSearches = const <String>[],
    this.onChanged,
    this.onClear,
    this.onVoiceTap,
    this.width = 343,
  });

  final MiniloSearchMobileState state;
  final TextEditingController? controller;
  final String hintText;
  final String recentTitle;
  final String popularTitle;
  final List<String> recentSearches;
  final List<String> popularSearches;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onVoiceTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isTyping = state == MiniloSearchMobileState.typing;
    final isTyped = state == MiniloSearchMobileState.typed;

    String placeholderText() {
      if (isTyping) {
        return 'Typing State|';
      }
      if (isTyped) {
        return 'Typed State';
      }
      return hintText;
    }

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            height: 48,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF191D23),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: placeholderText(),
                hintStyle: TextStyle(
                  fontFamily: 'Noto Sans',
                  fontSize: 16,
                  height: 24 / 16,
                  fontWeight: FontWeight.w400,
                  color: isTyping || isTyped
                      ? const Color(0xFF191D23)
                      : const Color(0xFFB1B4B6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: isTyping
                        ? const Color(0xFF003078)
                        : const Color(0xFFB1B4B6),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF003078)),
                ),
                suffixIcon: SizedBox(
                  width: 84,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isTyping || isTyped)
                        IconButton(
                          onPressed: onClear,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints.tightFor(
                            width: 20,
                            height: 20,
                          ),
                          visualDensity: VisualDensity.compact,
                          splashRadius: 12,
                          icon: const Icon(
                            Icons.close,
                            size: 16,
                            color: Color(0xFF383F43),
                          ),
                        ),
                      Container(
                        width: 1,
                        height: 20,
                        color: const Color(0xFFB1B4B6),
                      ),
                      IconButton(
                        onPressed: onVoiceTap,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          width: 20,
                          height: 20,
                        ),
                        visualDensity: VisualDensity.compact,
                        splashRadius: 12,
                        icon: const Icon(
                          Icons.mic_none,
                          size: 20,
                          color: Color(0xFF003078),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isTyped) ...[
            const SizedBox(height: 24),
            _SearchSuggestionGroup(
              title: recentTitle,
              rows: recentSearches,
              leadingIcon: Icons.history,
              trailingSearchIcon: false,
              width: width,
            ),
            const SizedBox(height: 24),
            _SearchSuggestionGroup(
              title: popularTitle,
              rows: popularSearches,
              leadingIcon: Icons.trending_up,
              trailingSearchIcon: true,
              width: width,
            ),
          ],
        ],
      ),
    );
  }
}

class _SearchSuggestionGroup extends StatelessWidget {
  const _SearchSuggestionGroup({
    required this.title,
    required this.rows,
    required this.leadingIcon,
    required this.trailingSearchIcon,
    required this.width,
  });

  final String title;
  final List<String> rows;
  final IconData leadingIcon;
  final bool trailingSearchIcon;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Noto Sans',
            fontSize: 12,
            height: 24 / 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF383F43),
          ),
        ),
        const SizedBox(height: 8),
        ...rows.map(
          (value) => Container(
            width: width,
            height: 48,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFF3F2F1))),
            ),
            child: Row(
              children: [
                Icon(leadingIcon, size: 20, color: const Color(0xFFB1B4B6)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 14,
                      height: 24 / 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                if (trailingSearchIcon)
                  const Icon(Icons.search, size: 20, color: Color(0xFFB1B4B6)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
