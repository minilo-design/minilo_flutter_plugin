import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

class MiniloPageFooter extends StatelessWidget {
  const MiniloPageFooter({
    super.key,
    this.title,
    this.subtitle,
    this.actions = const <Widget>[],
  });

  final String? title;
  final String? subtitle;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFE9E9E9)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: minilo.colors.text,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: minilo.colors.textMuted,
                        ),
                  ),
              ],
            ),
          ),
          if (actions.isNotEmpty)
            Wrap(
              spacing: 8,
              children: actions,
            ),
        ],
      ),
    );
  }
}
