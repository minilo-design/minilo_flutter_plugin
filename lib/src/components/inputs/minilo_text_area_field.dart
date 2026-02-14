import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

class MiniloTextAreaField extends StatelessWidget {
  const MiniloTextAreaField({
    super.key,
    this.label = 'Description',
    this.controller,
    this.placeholder = 'Type your content',
    this.helperText = 'Use clear and concise language.',
    this.error,
    this.enabled = true,
    this.required = false,
    this.minLines = 4,
    this.maxLines,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final String placeholder;
  final String? helperText;
  final String? error;
  final bool enabled;
  final bool required;
  final int minLines;
  final int? maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final hasError = error != null && error!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleSmall,
            children: [
              TextSpan(text: label),
              if (required)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Color(0xFFB91C1C)),
                ),
            ],
          ),
        ),
        SizedBox(height: minilo.spacing.s2),
        TextField(
          controller: controller,
          enabled: enabled,
          minLines: minLines,
          maxLines: maxLines ?? minLines + 2,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Color(0xFF98A2B3)),
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor:
                enabled ? minilo.colors.surface : minilo.colors.surfaceMuted,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(minilo.radius.md),
              borderSide: BorderSide(
                  color: hasError ? minilo.colors.alert : minilo.colors.border),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(minilo.radius.md),
              borderSide: BorderSide(color: minilo.colors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(minilo.radius.md),
              borderSide: BorderSide(
                  color:
                      hasError ? minilo.colors.alert : minilo.colors.primary),
            ),
          ),
        ),
        if (hasError) ...[
          SizedBox(height: minilo.spacing.s2),
          Text(
            error!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xFFB91C1C),
                  fontWeight: FontWeight.w700,
                ),
          ),
        ] else if (helperText != null && helperText!.isNotEmpty) ...[
          SizedBox(height: minilo.spacing.s2),
          Text(
            helperText!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}
