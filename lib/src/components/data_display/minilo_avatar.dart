import 'package:flutter/material.dart';
import '../../foundation/minilo_theme.dart';

enum MiniloAvatarSize {
  sm(32),
  md(40),
  lg(48),
  xl(64);

  final double value;
  const MiniloAvatarSize(this.value);
}

class MiniloAvatar extends StatelessWidget {
  const MiniloAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = MiniloAvatarSize.md,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String? imageUrl;
  final String? initials;
  final MiniloAvatarSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final bgColor = backgroundColor ?? minilo.colors.surface;
    final fgColor = foregroundColor ?? minilo.colors.primary;

    return Container(
      width: size.value,
      height: size.value,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: minilo.colors.border),
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      alignment: Alignment.center,
      child: imageUrl == null
          ? Text(
              initials?.toUpperCase() ?? '',
              style: TextStyle(
                color: fgColor,
                fontWeight: FontWeight.w600,
                fontSize: size.value * 0.4,
              ),
            )
          : null,
    );
  }
}
