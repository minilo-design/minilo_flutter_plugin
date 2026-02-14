import 'package:flutter/material.dart';

import '../../foundation/minilo_shimmer.dart';
import '../../foundation/minilo_theme.dart';

class MiniloAccordion extends StatefulWidget {
  const MiniloAccordion({
    super.key,
    this.title = 'Accordion Title',
    required this.child,
    this.loading = false,
    this.initiallyOpen = false,
  });

  final String title;
  final Widget child;
  final bool loading;
  final bool initiallyOpen;

  @override
  State<MiniloAccordion> createState() => _MiniloAccordionState();
}

class _MiniloAccordionState extends State<MiniloAccordion> {
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.initiallyOpen;
  }

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 343,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F2F1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 48,
            child: TextButton(
              onPressed: widget.loading
                  ? null
                  : () {
                      setState(() {
                        _isOpen = !_isOpen;
                      });
                    },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                foregroundColor: const Color(0xFF191D23),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: widget.loading
                        ? const MiniloShimmerBox(width: 160, height: 16)
                        : Text(
                            widget.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF191D23),
                                ),
                          ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: _isOpen ? 0.5 : 0,
                    child: const Icon(Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF383F43)),
                  ),
                ],
              ),
            ),
          ),
          if (_isOpen && !widget.loading) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                  color: const Color(0xFFB1B4B6), thickness: 1, height: 1),
            ),
            Padding(
              padding: EdgeInsets.all(minilo.spacing.s4),
              child: widget.child,
            ),
          ],
        ],
      ),
    );
  }
}
