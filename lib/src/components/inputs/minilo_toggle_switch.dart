import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

class MiniloToggleSwitch extends StatefulWidget {
  const MiniloToggleSwitch({
    super.key,
    this.label = 'Enable setting',
    this.hint = 'Use toggle to turn this option on or off.',
    this.value,
    this.initialValue = false,
    this.onChanged,
    this.enabled = true,
    this.width = 343,
  });

  final String label;
  final String? hint;
  final bool? value;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final bool enabled;
  final double width;

  @override
  State<MiniloToggleSwitch> createState() => _MiniloToggleSwitchState();
}

class _MiniloToggleSwitchState extends State<MiniloToggleSwitch> {
  late bool _internalValue;

  bool get _isControlled => widget.value != null;

  bool get _effectiveValue => widget.value ?? _internalValue;

  @override
  void initState() {
    super.initState();
    _internalValue = widget.initialValue;
  }

  void _handleChanged(bool value) {
    if (!_isControlled) {
      setState(() {
        _internalValue = value;
      });
    }
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return SizedBox(
      width: widget.width,
      child: Container(
        padding: EdgeInsets.all(minilo.spacing.s3),
        decoration: BoxDecoration(
          color: minilo.colors.surface,
          border: Border.all(color: minilo.colors.border),
          borderRadius: BorderRadius.circular(minilo.radius.md),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Switch(
                  value: _effectiveValue,
                  onChanged: widget.enabled ? _handleChanged : null,
                  // ignore: deprecated_member_use
                  activeColor: minilo.colors.white,
                  activeTrackColor: minilo.colors.primary,
                  inactiveTrackColor: const Color(0xFFF1F5F9),
                ),
              ],
            ),
            if (widget.hint != null && widget.hint!.isNotEmpty)
              Text(
                widget.hint!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
