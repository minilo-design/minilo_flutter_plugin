# Minilo Design System (Flutter)

[![Pub Version](https://img.shields.io/pub/v/minilo_design_system)](https://pub.dev/packages/minilo_design_system)

Official Flutter component library for the Minilo Design System. This package provides a comprehensive set of UI components, theme tokens, and utilities to build applications with the Minilo design language.

- **Design Source**: [Minilo Figma](https://www.figma.com/design/eOMBuOepZXFo3g4LclkXlO/Minilo-Design-System)
- **System Site**: [design.minilo.io](https://design.minilo.io)

## Features

- **Design Tokens**: Access to Minilo's color palette, typography, spacing, and radius.
- **Theming**: Built-in light and dark mode support via `MiniloTheme`.
- **Components**: A wide range of ready-to-use widgets including buttons, cards, inputs, navigation, and more.
- **Responsive**: Components designed to work across mobile and desktop layouts.

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  minilo_design_system: ^0.1.2
```

Run `flutter pub get` to install.

## Usage

### 1. Setup Theme

Wrap your application with `MiniloTheme` or use the provided `ThemeData` builders:

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
      title: 'Minilo App',
      // Apply Minilo Light Theme
      theme: miniloThemeData(brightness: Brightness.light),
      // Apply Minilo Dark Theme
      darkTheme: miniloThemeData(brightness: Brightness.dark),
      home: const HomePage(),
    );
  }
}
```

### 2. Use Components

#### Buttons

```dart
Column(
  children: [
    MiniloPrimaryButton(
      label: 'Primary Action',
      onPressed: () {},
    ),
    const SizedBox(height: 16),
    MiniloSecondaryButton(
      label: 'Secondary Action',
      onPressed: () {},
    ),
  ],
)
```

#### Inputs

```dart
MiniloTextField(
  label: 'Email Address',
  placeholder: 'Enter your email',
  prefixIcon: Icons.email_outlined,
  onChanged: (value) => print(value),
)
```

#### Cards

```dart
MiniloCardLarge(
  title: 'Project Alpha',
  subtitle: 'Updated 2 hours ago',
  status: MiniloBadge(label: 'Active', color: Colors.green),
  onTap: () {},
)
```

#### Avatar

```dart
MiniloAvatar(
  initials: 'JD',
  size: MiniloAvatarSize.lg,
  backgroundColor: Colors.blue.shade100,
)
```

## Component Library

| Category | Components |
|----------|------------|
| **Buttons** | `MiniloPrimaryButton`, `MiniloSecondaryButton`, `MiniloTertiaryButton`, `MiniloTileButton` |
| **Cards** | `MiniloCardLarge`, `MiniloCardSmall`, `MiniloCardXs`, `MiniloProfileCard`, `MiniloItemCard`, `MiniloPieChartCard` |
| **Inputs** | `MiniloTextField`, `MiniloTextAreaField`, `MiniloSearchField`, `MiniloDropdownField`, `MiniloDocumentSelection`, `MiniloToggleSwitch`, `MiniloCheckbox`, `MiniloRadio` |
| **Navigation** | `MiniloAppBar`, `MiniloBottomNavBar`, `MiniloBreadcrumbs`, `MiniloSideTabs`, `MiniloTopTabs` |
| **Feedback** | `MiniloAlertBanner`, `MiniloToast`, `MiniloLinearProgress` |
| **Data Display** | `MiniloBadge`, `MiniloStatCard`, `MiniloLabel`, `MiniloAvatar` |
| **Layout** | `MiniloSectionHeader`, `MiniloPageFooter`, `MiniloAccordion` |

## Theme Access

You can access theme tokens directly using the `context.minilo` extension:

```dart
Widget build(BuildContext context) {
  final minilo = context.minilo;
  
  return Container(
    color: minilo.colors.surface,
    padding: EdgeInsets.all(minilo.spacing.md),
    child: Text(
      'Hello Minilo',
      style: minilo.typography.bodyLarge.copyWith(
        color: minilo.colors.textPrimary,
      ),
    ),
  );
}
```

## Contributing

Contributions are welcome! If you find a bug or want to suggest a feature, please open an issue on our [GitHub repository](https://github.com/minilo-design/minilo-design-system).

## License

BSD-3-Clause. See [LICENSE](LICENSE) for more details.
