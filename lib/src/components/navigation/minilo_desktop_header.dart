import 'package:flutter/material.dart';

@immutable
class MiniloHeaderMenuChip {
  const MiniloHeaderMenuChip({
    required this.icon,
    this.onTap,
    this.badgeCount,
    this.width = 58,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final int? badgeCount;
  final double width;
}

enum MiniloDesktopHeaderState {
  closed,
  open,
}

class MiniloDesktopHeader extends StatelessWidget {
  const MiniloDesktopHeader({
    super.key,
    this.state = MiniloDesktopHeaderState.closed,
    this.title = 'Logo',
    this.searchHint = 'Search...',
    this.onSearchChanged,
    this.onMenuTap,
    this.profileName = 'User Name',
    this.profileEmail = 'email@example.com',
    this.profileAvatar,
    this.menuChips = const <MiniloHeaderMenuChip>[],
  });

  final MiniloDesktopHeaderState state;
  final String title;
  final String searchHint;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onMenuTap;
  final String profileName;
  final String profileEmail;
  final Widget? profileAvatar;
  final List<MiniloHeaderMenuChip> menuChips;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: 1440,
          height: 80,
          color: const Color(0xFFFFFFFF),
          child: Stack(
            children: [
              Positioned(
                left: 12,
                right: 12,
                bottom: 0,
                child: Container(
                  height: 1,
                  color: const Color(0x3034437B),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    InkWell(
                      onTap: onMenuTap,
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        width: 265,
                        height: 28,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 28,
                              height: 28,
                              child: Icon(
                                Icons.blur_circular,
                                size: 28,
                                color: Color(0xFF003078),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 32,
                                height: 24 / 32,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 941,
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 314,
                            height: 44,
                            child: TextField(
                              onChanged: onSearchChanged,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                hintText: searchHint,
                                hintStyle: const TextStyle(
                                  fontFamily: 'Noto Sans',
                                  fontSize: 16,
                                  height: 24 / 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFB1B4B6),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Color(0xFFB1B4B6),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFB1B4B6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF003078)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          ...menuChips.map((chip) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: _HeaderChip(chip: chip),
                            );
                          }),
                          _ProfileBlock(
                            profileAvatar: profileAvatar,
                            profileName: profileName,
                            profileEmail: profileEmail,
                          ),
                        ],
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

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.chip});

  final MiniloHeaderMenuChip chip;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: chip.width,
          height: 28,
          child: OutlinedButton(
            onPressed: chip.onTap,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              side: const BorderSide(color: Color(0xFFB1B4B6)),
              minimumSize: const Size(0, 0),
              fixedSize: Size(chip.width, 28),
              maximumSize: Size(chip.width, 28),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              backgroundColor: const Color(0xFFFFFFFF),
            ),
            child: Icon(chip.icon, size: 20, color: const Color(0xFF003078)),
          ),
        ),
        if (chip.badgeCount != null && chip.badgeCount! > 0)
          Positioned(
            right: -5,
            top: -6,
            child: Container(
              width: 16,
              height: 16,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD4351C),
              ),
              child: Text(
                '${chip.badgeCount}',
                style: const TextStyle(
                  fontFamily: 'Noto Sans',
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ProfileBlock extends StatelessWidget {
  const _ProfileBlock({
    required this.profileAvatar,
    required this.profileName,
    required this.profileEmail,
  });

  final Widget? profileAvatar;
  final String profileName;
  final String profileEmail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 251,
      height: 44,
      child: Row(
        children: [
          SizedBox(
            width: 44,
            height: 44,
            child: ClipOval(
              child: profileAvatar ??
                  const ColoredBox(
                    color: Color(0xFFD9D9D9),
                    child: Icon(Icons.person_outline),
                  ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 16,
                    height: 22 / 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF191D23),
                  ),
                ),
                Text(
                  profileEmail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Noto Sans',
                    fontSize: 12,
                    height: 22 / 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF383F43),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 22,
            height: 22,
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Color(0xFF383F43),
            ),
          ),
        ],
      ),
    );
  }
}
