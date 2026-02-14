import 'package:flutter/material.dart';

import 'minilo_text_field.dart';

class MiniloTextFieldWithTooltip extends StatefulWidget {
  const MiniloTextFieldWithTooltip({
    super.key,
    required this.label,
    this.tooltipMessage = 'Tooltip on top',
    this.placeholder,
    this.controller,
    this.width = 343,
    this.showInfoIcon = true,
    this.enabled = true,
    this.onChanged,
    this.active = false,
  });

  final String label;
  final String tooltipMessage;
  final String? placeholder;
  final TextEditingController? controller;
  final double width;
  final bool showInfoIcon;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final bool active;

  @override
  State<MiniloTextFieldWithTooltip> createState() =>
      _MiniloTextFieldWithTooltipState();
}

class _MiniloTextFieldWithTooltipState
    extends State<MiniloTextFieldWithTooltip> {
  bool _showTooltip = false;

  void _toggleTooltip() {
    setState(() => _showTooltip = !_showTooltip);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          MiniloTextField(
            label: widget.label,
            controller: widget.controller,
            placeholder: widget.placeholder,
            enabled: widget.enabled,
            active: widget.active,
            onChanged: widget.onChanged,
            trailing: widget.showInfoIcon
                ? IconButton(
                    onPressed: _toggleTooltip,
                    icon: const Icon(
                      Icons.info_outline,
                      size: 24,
                      color: Color(0xFF383F43),
                    ),
                  )
                : null,
          ),
          if (_showTooltip)
            Positioned(
              top: -67,
              right: 11,
              child: Column(
                children: [
                  Container(
                    width: 242,
                    height: 56,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF003078),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      widget.tooltipMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 12,
                        height: 24 / 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: _TooltipTailClipper(),
                    child: Container(
                      width: 34,
                      height: 8,
                      color: const Color(0xFF003078),
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

class _TooltipTailClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
