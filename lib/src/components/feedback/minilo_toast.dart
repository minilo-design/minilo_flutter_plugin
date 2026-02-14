import 'package:flutter/material.dart';

enum MiniloToastType {
  success,
  warning,
  notify,
  error,
}

class MiniloToast extends StatelessWidget {
  const MiniloToast({
    super.key,
    required this.message,
    this.type = MiniloToastType.notify,
    this.onClose,
  });

  final String message;
  final MiniloToastType type;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final values = switch (type) {
      MiniloToastType.success => (
          bg: const Color(0xFFE6EFEA),
          fg: const Color(0xFF005A30),
          icon: Icons.check_circle,
        ),
      MiniloToastType.warning => (
          bg: const Color(0xFFFFFCE6),
          fg: const Color(0xFF6B5D00),
          icon: Icons.warning_amber_rounded,
        ),
      MiniloToastType.notify => (
          bg: const Color(0xFFE6EAF2),
          fg: const Color(0xFF1D70B8),
          icon: Icons.info_outline,
        ),
      MiniloToastType.error => (
          bg: const Color(0xFFFBEBE8),
          fg: const Color(0xFFD4351C),
          icon: Icons.error_outline,
        ),
    };

    return Container(
      width: 349,
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: values.bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(values.icon, size: 24, color: values.fg),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontFamily: 'Noto Sans',
                fontSize: 16,
                height: 24 / 16,
                fontWeight: FontWeight.w500,
                color: values.fg,
              ),
            ),
          ),
          IconButton(
            onPressed: onClose,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(width: 16, height: 16),
            icon: const Icon(
              Icons.close,
              size: 16,
              color: Color(0xFF323232),
            ),
          ),
        ],
      ),
    );
  }
}
