import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minilo_design_system/minilo_design_system.dart';

void main() {
  testWidgets('Minilo primary button renders label', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: miniloThemeData(),
        home: const Scaffold(
          body: MiniloPrimaryButton(label: 'Continue'),
        ),
      ),
    );

    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Minilo primary button calls onPressed when enabled',
      (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: miniloThemeData(),
        home: Scaffold(
          body: MiniloPrimaryButton(
            label: 'Save',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });

  testWidgets('Minilo toggle switch sends updated value', (tester) async {
    bool? changed;

    await tester.pumpWidget(
      MaterialApp(
        theme: miniloThemeData(),
        home: Scaffold(
          body: MiniloToggleSwitch(
            initialValue: false,
            onChanged: (value) => changed = value,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(changed, isTrue);
  });

  testWidgets('Minilo dropdown field selects option', (tester) async {
    String? selected;

    await tester.pumpWidget(
      MaterialApp(
        theme: miniloThemeData(),
        home: Scaffold(
          body: MiniloDropdownField<String>(
            options: const [
              MiniloDropdownOption(value: 'a', label: 'Option A'),
              MiniloDropdownOption(value: 'b', label: 'Option B'),
            ],
            value: selected,
            onChanged: (value) {
              selected = value;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Option B').last);
    await tester.pumpAndSettle();

    expect(selected, 'b');
  });

  testWidgets('Minilo accordion opens and reveals content', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: miniloThemeData(),
        home: const Scaffold(
          body: MiniloAccordion(
            title: 'Accordion Title',
            child: Text('Accordion Content'),
          ),
        ),
      ),
    );

    expect(find.text('Accordion Content'), findsNothing);

    await tester.tap(find.text('Accordion Title'));
    await tester.pumpAndSettle();

    expect(find.text('Accordion Content'), findsOneWidget);
  });
}
