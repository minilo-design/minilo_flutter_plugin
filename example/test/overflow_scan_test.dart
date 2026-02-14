import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minilo_design_system/minilo_design_system.dart';

import 'package:minilo_design_system_example/main.dart';

void main() {
  testWidgets('All widget previews render without framework exceptions',
      (tester) async {
    for (final entry in MiniloExampleApp.entries) {
      await tester.pumpWidget(
        MaterialApp(
          theme: miniloThemeData(),
          home: WidgetPreviewPage(entry: entry),
        ),
      );
      await tester.pumpAndSettle();

      final exception = tester.takeException();
      expect(exception, isNull, reason: 'Exception in route ${entry.route}');
    }
  });
}
