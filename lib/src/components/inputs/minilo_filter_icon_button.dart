import 'package:flutter/material.dart';

class MiniloFilterIconButton extends StatelessWidget {
  const MiniloFilterIconButton({
    super.key,
    this.active = false,
    this.count,
    this.onPressed,
    this.size = 48,
  });

  final bool active;
  final int? count;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: active
                      ? const Color(0xFF003078)
                      : const Color(0xFFB1B4B6),
                  width: 0.857143,
                ),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(0, 0),
                fixedSize: Size.square(size),
                maximumSize: Size.square(size),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.42857),
                ),
                backgroundColor: const Color(0xFFFFFFFF),
              ),
              child: const Icon(
                Icons.filter_alt_outlined,
                size: 20.57,
                color: Color(0xFF003078),
              ),
            ),
          ),
          if (count != null && count! > 0)
            Positioned(
              left: 31.29,
              top: -6,
              child: SizedBox(
                width: 20,
                height: 24,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 3,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFFFFF),
                          border: Border.fromBorderSide(
                            BorderSide(color: Color(0xFF003078), width: 1),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 6,
                      top: -6,
                      child: Text(
                        '$count',
                        style: const TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 12,
                          height: 24 / 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF003078),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
