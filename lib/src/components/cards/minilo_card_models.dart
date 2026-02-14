import 'package:flutter/material.dart';

@immutable
class MiniloCardDetail {
  const MiniloCardDetail({required this.label, required this.value});

  final String label;
  final String value;
}
