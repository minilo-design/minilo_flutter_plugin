import 'package:flutter/material.dart';

import '../../foundation/minilo_theme.dart';

@immutable
class MiniloAccordionListItem {
  const MiniloAccordionListItem({
    required this.title,
    required this.content,
  });

  final String title;
  final Widget content;
}

class MiniloAccordionList extends StatefulWidget {
  const MiniloAccordionList({
    super.key,
    required this.items,
    this.initialOpenIndex,
  });

  final List<MiniloAccordionListItem> items;
  final int? initialOpenIndex;

  @override
  State<MiniloAccordionList> createState() => _MiniloAccordionListState();
}

class _MiniloAccordionListState extends State<MiniloAccordionList> {
  int? _expandedIndex;

  @override
  void initState() {
    super.initState();
    _expandedIndex = widget.initialOpenIndex;
  }

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return Column(
      children: List<Widget>.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final expanded = index == _expandedIndex;

        return Container(
          margin: EdgeInsets.only(bottom: minilo.spacing.s2),
          decoration: BoxDecoration(
            color: minilo.colors.surface,
            border: Border.all(color: const Color(0xFFB1B4B6)),
            borderRadius: BorderRadius.circular(minilo.radius.md),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  item.title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: minilo.colors.text,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                trailing: Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: minilo.colors.primary,
                ),
                onTap: () {
                  setState(() {
                    _expandedIndex = expanded ? null : index;
                  });
                },
              ),
              if (expanded)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: item.content,
                ),
            ],
          ),
        );
      }),
    );
  }
}
