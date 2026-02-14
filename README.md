# Minilo Design System (Flutter)

Official Flutter component library for the Minilo Design System.

- Design source: [Minilo Figma](https://www.figma.com/design/eOMBuOepZXFo3g4LclkXlO/Minilo-Design-System)
- System site: [design.minilo.io](https://design.minilo.io)

## Features

- Minilo design tokens (colors, spacing, radius, shadows, typography)
- Light and dark theme support via `MiniloTheme`
- Reusable UI components across categories:
  - Buttons
  - Cards
  - Inputs
  - Navigation
  - Feedback
  - Data display
  - Layout
  - Containers

## Installation

```yaml
dependencies:
  minilo_design_system: ^0.1.0
```

## Quick Start

```dart
import 'package:flutter/material.dart';
import 'package:minilo_design_system/minilo_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miniloThemeData(),
      darkTheme: miniloThemeData(brightness: Brightness.dark),
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: MiniloPrimaryButton(label: 'Continue'),
        ),
      ),
    );
  }
}
```

## Component Coverage

- Buttons: `MiniloPrimaryButton`, `MiniloSecondaryButton`, `MiniloTertiaryButton`, `MiniloTileButton`
- Cards: `MiniloCardLarge`, `MiniloCardSmall`, `MiniloCardXs`, `MiniloProfileCard`, `MiniloItemCard`
- Inputs: `MiniloTextField`, `MiniloTextAreaField`, `MiniloSearchField`, `MiniloDropdownField`, `MiniloDocumentSelection`, `MiniloToggleSwitch`
- Navigation: `MiniloAppBar`, `MiniloAppBarAlt`, `MiniloBottomNavBar`, `MiniloBreadcrumbs`
- Feedback: `MiniloAlertBanner`
- Data display: `MiniloBadge`, `MiniloStatCard`
- Layout: `MiniloSectionHeader`
- More: `MiniloAccordion`
- Containers: `MiniloContainerCard`, `MiniloSampleContainerOne`

## Notes

- This release mirrors Minilo's public web component language and token values.
- For pixel-perfect parity with private Figma variants or icon sets, plug in your final assets and spacing overrides on top of these components.

## License

BSD-3-Clause (same as package `LICENSE`).
# minilo_flutter_plugin
