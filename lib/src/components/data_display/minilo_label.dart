import 'package:flutter/material.dart';

enum MiniloLabelTone {
  green,
  red,
  yellow,
  blue,
  grey,
}

class MiniloLabel extends StatelessWidget {
  const MiniloLabel({
    super.key,
    required this.text,
    this.tone = MiniloLabelTone.grey,
  });

  final String text;
  final MiniloLabelTone tone;

  @override
  Widget build(BuildContext context) {
    final values = switch (tone) {
      MiniloLabelTone.green => (
          bg: const Color(0xFFE6EFEA),
          fg: const Color(0xFF005A30),
        ),
      MiniloLabelTone.red => (
          bg: const Color(0xFFFBEBE8),
          fg: const Color(0xFFD4351C),
        ),
      MiniloLabelTone.yellow => (
          bg: const Color(0xFFFFFCE6),
          fg: const Color(0xFF383F43),
        ),
      MiniloLabelTone.blue => (
          bg: const Color(0xFFE8F1F8),
          fg: const Color(0xFF1D70B8),
        ),
      MiniloLabelTone.grey => (
          bg: const Color(0xFFEBECEC),
          fg: const Color(0xFF383F43),
        ),
    };

    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: values.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Noto Sans',
          fontSize: 12,
          height: 24 / 12,
          fontWeight: FontWeight.w400,
          color: values.fg,
        ),
      ),
    );
  }
}
