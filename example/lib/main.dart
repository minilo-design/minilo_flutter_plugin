import 'package:flutter/material.dart';
import 'package:minilo_design_system/minilo_design_system.dart';

void main() {
  runApp(const MiniloExampleApp());
}

class MiniloExampleApp extends StatelessWidget {
  const MiniloExampleApp({super.key});

  static final List<WidgetCatalogEntry> entries = buildCatalogEntries();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minilo Flutter Design System',
      debugShowCheckedModeBanner: false,
      theme: miniloThemeData(),
      darkTheme: miniloThemeData(brightness: Brightness.dark),
      home: WidgetCatalogHome(entries: entries),
      onGenerateRoute: (settings) {
        final name = settings.name;
        if (name == null || name == '/') {
          return MaterialPageRoute<void>(
            builder: (_) => WidgetCatalogHome(entries: entries),
          );
        }

        if (name == '/visual-grid') {
          return MaterialPageRoute<void>(
            builder: (_) => WidgetVisualGridPage(entries: entries),
            settings: settings,
          );
        }

        for (final entry in entries) {
          if (entry.route == name) {
            return MaterialPageRoute<void>(
              builder: (_) => WidgetPreviewPage(entry: entry),
              settings: settings,
            );
          }
        }

        return MaterialPageRoute<void>(
          builder: (_) => WidgetCatalogHome(entries: entries),
        );
      },
    );
  }
}

typedef WidgetPreviewBuilder = Widget Function(BuildContext context);

@immutable
class WidgetCatalogEntry {
  const WidgetCatalogEntry({
    required this.route,
    required this.group,
    required this.title,
    required this.builder,
    this.description,
    this.previewSize,
  });

  final String route;
  final String group;
  final String title;
  final WidgetPreviewBuilder builder;
  final String? description;
  final Size? previewSize;
}

class WidgetCatalogHome extends StatefulWidget {
  const WidgetCatalogHome({super.key, required this.entries});

  final List<WidgetCatalogEntry> entries;

  @override
  State<WidgetCatalogHome> createState() => _WidgetCatalogHomeState();
}

class _WidgetCatalogHomeState extends State<WidgetCatalogHome> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;
    final query = _searchController.text.trim().toLowerCase();

    final filtered = widget.entries.where((entry) {
      if (query.isEmpty) {
        return true;
      }
      return entry.title.toLowerCase().contains(query) ||
          entry.group.toLowerCase().contains(query);
    }).toList();

    final groupOrder = <String>[
      'Buttons',
      'Inputs',
      'Selection',
      'Cards',
      'Feedback',
      'Data Display',
      'Navigation',
      'Tabs',
      'Stepper',
      'Search',
      'Pagination',
      'Layout',
      'Charts',
      'Containers',
      'More',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Minilo Widget Catalog')),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(minilo.spacing.s4),
          children: [
            MiniloSectionHeader(
              eyebrow: 'Minilo Flutter',
              title: 'Component Showcase',
              description:
                  'Open any widget below to see a dedicated visual preview page.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search widgets...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton.icon(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/visual-grid'),
                icon: const Icon(Icons.grid_view_outlined),
                label: const Text('Visual Grid Preview'),
              ),
            ),
            const SizedBox(height: 16),
            for (final group in groupOrder) ...[
              if (filtered.any((entry) => entry.group == group)) ...[
                Text(
                  group,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                ...filtered.where((entry) => entry.group == group).map(
                      (entry) => Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(entry.title),
                          subtitle: entry.description == null
                              ? null
                              : Text(entry.description!),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () =>
                              Navigator.of(context).pushNamed(entry.route),
                        ),
                      ),
                    ),
                const SizedBox(height: 8),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class WidgetVisualGridPage extends StatelessWidget {
  const WidgetVisualGridPage({super.key, required this.entries});

  final List<WidgetCatalogEntry> entries;

  @override
  Widget build(BuildContext context) {
    final minilo = context.minilo;

    final groups = <String, List<WidgetCatalogEntry>>{};
    for (final entry in entries) {
      groups.putIfAbsent(entry.group, () => <WidgetCatalogEntry>[]).add(entry);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Visual Grid Preview')),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(minilo.spacing.s4),
          children: groups.entries.map((group) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.key,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: group.value.map((entry) {
                      return _WidgetPreviewTile(entry: entry);
                    }).toList(),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _WidgetPreviewTile extends StatelessWidget {
  const _WidgetPreviewTile({required this.entry});

  final WidgetCatalogEntry entry;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => Navigator.of(context).pushNamed(entry.route),
      child: Container(
        width: 340,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.minilo.colors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: context.minilo.colors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            _PreviewCanvas(entry: entry),
          ],
        ),
      ),
    );
  }
}

class WidgetPreviewPage extends StatelessWidget {
  const WidgetPreviewPage({super.key, required this.entry});

  final WidgetCatalogEntry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(entry.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              entry.group,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            if (entry.description != null) ...[
              const SizedBox(height: 6),
              Text(
                entry.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            const SizedBox(height: 16),
            _PreviewCanvas(entry: entry),
          ],
        ),
      ),
    );
  }
}

class _PreviewCanvas extends StatelessWidget {
  const _PreviewCanvas({required this.entry});

  final WidgetCatalogEntry entry;

  @override
  Widget build(BuildContext context) {
    final size = entry.previewSize;
    final previewChild = entry.builder(context);

    final Widget previewViewport;
    if (size == null) {
      previewViewport = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: previewChild,
      );
    } else {
      previewViewport = SizedBox(
        width: size.width,
        height: size.height,
        child: ClipRect(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: size.width,
                  minHeight: size.height,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: previewChild,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.minilo.colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.minilo.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (size != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '${size.width.toInt()} x ${size.height.toInt()} px',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          previewViewport,
        ],
      ),
    );
  }
}

List<WidgetCatalogEntry> buildCatalogEntries() {
  return <WidgetCatalogEntry>[
    WidgetCatalogEntry(
      route: '/buttons/primary',
      group: 'Buttons',
      title: 'Primary Button',
      previewSize: const Size(136, 52),
      builder: (_) => MiniloPrimaryButton(label: 'Add New', onPressed: () {}),
    ),
    WidgetCatalogEntry(
      route: '/buttons/secondary',
      group: 'Buttons',
      title: 'Secondary Button',
      previewSize: const Size(136, 52),
      builder: (_) => MiniloSecondaryButton(
        label: 'Add New',
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/buttons/tertiary',
      group: 'Buttons',
      title: 'Tertiary Button',
      previewSize: const Size(136, 52),
      builder: (_) => MiniloTertiaryButton(
        label: 'Add New',
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/buttons/tile',
      group: 'Buttons',
      title: 'Tile Button',
      previewSize: const Size(205, 64),
      builder: (_) => MiniloTileButton(
        width: 205,
        label: 'Go to profile',
        leading: const Icon(Icons.person_outline),
        onTap: () {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/text-field',
      group: 'Inputs',
      title: 'Text Field',
      previewSize: const Size(343, 52),
      builder: (_) => const MiniloTextField(
        label: 'Account Name',
        placeholder: 'Default State Input',
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/dropdown',
      group: 'Inputs',
      title: 'Dropdown Field',
      previewSize: const Size(343, 76),
      builder: (_) => MiniloDropdownField<String>(
        label: 'Role',
        placeholder: 'Select option',
        options: const [
          MiniloDropdownOption(value: 'designer', label: 'Designer'),
          MiniloDropdownOption(value: 'developer', label: 'Developer'),
        ],
        onChanged: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/text-field-tooltip',
      group: 'Inputs',
      title: 'Text Field With Tooltip',
      previewSize: const Size(343, 52),
      builder: (_) => const MiniloTextFieldWithTooltip(
        label: 'Account Name',
        placeholder: 'Filled State Input',
        tooltipMessage: 'Tooltip on top',
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/text-area',
      group: 'Inputs',
      title: 'Text Area Field',
      previewSize: const Size(343, 108),
      builder: (_) => const MiniloTextAreaField(),
    ),
    WidgetCatalogEntry(
      route: '/inputs/search-field',
      group: 'Inputs',
      title: 'Search Field',
      previewSize: const Size(343, 48),
      builder: (_) => const MiniloSearchField(),
    ),
    WidgetCatalogEntry(
      route: '/inputs/search-desktop',
      group: 'Inputs',
      title: 'Search Bar Desktop',
      previewSize: const Size(260, 48),
      builder: (_) => const MiniloSearchBarDesktop(
        state: MiniloSearchBarDesktopState.active,
        hintText: 'Typing',
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/toggle',
      group: 'Inputs',
      title: 'Toggle Switch',
      previewSize: const Size(220, 72),
      builder: (_) => const MiniloToggleSwitch(
        width: 220,
        label: 'Toggle',
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/filter-button',
      group: 'Inputs',
      title: 'Filter Button',
      previewSize: const Size(48, 48),
      builder: (_) => const MiniloFilterIconButton(active: true, count: 4),
    ),
    WidgetCatalogEntry(
      route: '/inputs/filter-chips',
      group: 'Inputs',
      title: 'Filter Chips',
      previewSize: const Size(386, 28),
      builder: (_) => MiniloFilterChips(
        items: const [
          MiniloFilterChipItem(label: 'All', count: 37, selected: true),
          MiniloFilterChipItem(label: 'Approved', count: 30),
          MiniloFilterChipItem(label: 'Pending', count: 6),
          MiniloFilterChipItem(label: 'Rejected', count: 1),
        ],
        onTap: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/document-selection',
      group: 'Inputs',
      title: 'Document Selection',
      previewSize: const Size(343, 195),
      builder: (_) =>
          const MiniloDocumentSelection(fileName: 'Name of the Doc.PDF'),
    ),
    WidgetCatalogEntry(
      route: '/inputs/document-upload',
      group: 'Inputs',
      title: 'Document Upload',
      previewSize: const Size(420, 108),
      builder: (_) => const MiniloDocumentUpload(
        state: MiniloDocumentUploadState.upload,
      ),
    ),
    WidgetCatalogEntry(
      route: '/inputs/document-uploaded',
      group: 'Inputs',
      title: 'Document Uploaded State',
      previewSize: const Size(420, 60),
      builder: (_) => const MiniloDocumentUpload(
        state: MiniloDocumentUploadState.uploaded,
        fileName: 'Uploaded file.pdf',
      ),
    ),
    WidgetCatalogEntry(
      route: '/selection/checkbox',
      group: 'Selection',
      title: 'Checkbox',
      previewSize: const Size(52, 20),
      builder: (_) => const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MiniloCheckbox(value: true),
          SizedBox(width: 12),
          MiniloCheckbox(value: false),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/selection/radio',
      group: 'Selection',
      title: 'Radio',
      previewSize: const Size(52, 20),
      builder: (_) => const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MiniloRadio(selected: true),
          SizedBox(width: 12),
          MiniloRadio(selected: false),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/selection/radio-with-text',
      group: 'Selection',
      title: 'Radio With Text',
      previewSize: const Size(180, 20),
      builder: (_) => const MiniloRadioWithText<String>(
        label: 'Radio with Text',
        value: 'option-1',
        groupValue: 'option-1',
      ),
    ),
    WidgetCatalogEntry(
      route: '/cards/large',
      group: 'Cards',
      title: 'Card Large',
      previewSize: const Size(343, 368),
      builder: (_) => MiniloCardLarge(
        title: 'Candidate Profile',
        status: 'Approved',
        details: const [
          MiniloCardDetail(label: 'Name', value: 'Jane Cooper'),
          MiniloCardDetail(label: 'Experience', value: '8 years'),
          MiniloCardDetail(label: 'Location', value: 'Bengaluru'),
          MiniloCardDetail(label: 'Skills', value: 'Flutter, Dart'),
        ],
        onPrimaryAction: () {},
        onSecondaryAction: () {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/cards/large-vertical-list',
      group: 'Cards',
      title: 'Card Large Vertical List',
      previewSize: const Size(323, 203),
      builder: (_) => MiniloCardLargeVerticalList(
        item: const MiniloVerticalListItem(
          title: 'Coin',
          lines: ['Lorem ipsum dolor sit amet', 'Metus faucibus condimentum'],
          status: 'Approved',
        ),
        onApprove: () {},
        onReject: () {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/cards/small',
      group: 'Cards',
      title: 'Card Small',
      previewSize: const Size(194, 176),
      builder: (_) => const MiniloCardSmall(
        headline: 'Senior Flutter Engineer',
        text: 'Design and build scalable app architecture.',
        icon: Icon(Icons.work_outline),
      ),
    ),
    WidgetCatalogEntry(
      route: '/cards/xs',
      group: 'Cards',
      title: 'Card XS',
      previewSize: const Size(343, 104),
      builder: (_) => const MiniloCardXs(
        title: 'Feed Update',
        subtitle: 'New dashboard widgets released this week.',
      ),
    ),
    WidgetCatalogEntry(
      route: '/cards/item',
      group: 'Cards',
      title: 'Item Card',
      previewSize: const Size(323, 203),
      builder: (_) => const MiniloItemCard(),
    ),
    WidgetCatalogEntry(
      route: '/cards/profile',
      group: 'Cards',
      title: 'Profile Card',
      previewSize: const Size(343, 284),
      builder: (_) => const MiniloProfileCard(),
    ),
    WidgetCatalogEntry(
      route: '/cards/accordion-list',
      group: 'Cards',
      title: 'Accordion List',
      previewSize: const Size(343, 112),
      builder: (_) => const MiniloAccordionList(
        items: [
          MiniloAccordionListItem(
            title: 'Accordion List 1',
            content: Text('Accordion content one'),
          ),
          MiniloAccordionListItem(
            title: 'Accordion List 2',
            content: Text('Accordion content two'),
          ),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/feedback/alert-banner',
      group: 'Feedback',
      title: 'Alert Banner',
      previewSize: const Size(375, 80),
      builder: (_) => const SizedBox(
        width: 375,
        child: MiniloAlertBanner(
          title: 'System notice',
          message: 'Your profile updates were synced successfully.',
          variant: MiniloAlertVariant.success,
          dismissible: true,
        ),
      ),
    ),
    WidgetCatalogEntry(
      route: '/feedback/toast',
      group: 'Feedback',
      title: 'Toast',
      previewSize: const Size(349, 216),
      builder: (_) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MiniloToast(
              message: 'Success message', type: MiniloToastType.success),
          SizedBox(height: 8),
          MiniloToast(
              message: 'Warning message', type: MiniloToastType.warning),
          SizedBox(height: 8),
          MiniloToast(
              message: 'Notification message', type: MiniloToastType.notify),
          SizedBox(height: 8),
          MiniloToast(message: 'Error message', type: MiniloToastType.error),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/data/badge',
      group: 'Data Display',
      title: 'Badge',
      previewSize: const Size(280, 56),
      builder: (_) => const Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          MiniloBadge(label: 'Neutral'),
          MiniloBadge(label: 'Info', tone: MiniloBadgeTone.info, filled: true),
          MiniloBadge(
              label: 'Success', tone: MiniloBadgeTone.success, filled: true),
          MiniloBadge(
              label: 'Warning', tone: MiniloBadgeTone.warning, filled: true),
          MiniloBadge(
              label: 'Error', tone: MiniloBadgeTone.error, filled: true),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/data/label',
      group: 'Data Display',
      title: 'Label',
      previewSize: const Size(280, 24),
      builder: (_) => const Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          MiniloLabel(text: 'Green', tone: MiniloLabelTone.green),
          MiniloLabel(text: 'Red', tone: MiniloLabelTone.red),
          MiniloLabel(text: 'Yellow', tone: MiniloLabelTone.yellow),
          MiniloLabel(text: 'Blue', tone: MiniloLabelTone.blue),
          MiniloLabel(text: 'Grey', tone: MiniloLabelTone.grey),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/data/stat-card',
      group: 'Data Display',
      title: 'Stat Card',
      previewSize: const Size(343, 184),
      builder: (_) => const MiniloStatCard(),
    ),
    WidgetCatalogEntry(
      route: '/navigation/page-back',
      group: 'Navigation',
      title: 'Page Back Link',
      previewSize: const Size(81, 38),
      builder: (_) => MiniloPageBackLink(onTap: () {}),
    ),
    WidgetCatalogEntry(
      route: '/navigation/breadcrumbs',
      group: 'Navigation',
      title: 'Breadcrumbs',
      previewSize: const Size(189, 32),
      builder: (_) => MiniloBreadcrumbs(
        items: [
          MiniloBreadcrumbItem(label: 'Home', onTap: () {}),
          MiniloBreadcrumbItem(label: 'Docs', onTap: () {}),
          const MiniloBreadcrumbItem(label: 'Buttons', isCurrent: true),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/navigation/app-bar',
      group: 'Navigation',
      title: 'App Bar',
      previewSize: const Size(375, 100),
      builder: (_) => const MiniloAppBar(),
    ),
    WidgetCatalogEntry(
      route: '/navigation/app-bar-alt',
      group: 'Navigation',
      title: 'App Bar Alt',
      previewSize: const Size(375, 100),
      builder: (_) => const MiniloAppBarAlt(title: 'My Profile'),
    ),
    WidgetCatalogEntry(
      route: '/navigation/desktop-header',
      group: 'Navigation',
      title: 'Desktop Header',
      previewSize: const Size(1440, 80),
      builder: (_) => const MiniloDesktopHeader(
        state: MiniloDesktopHeaderState.open,
        title: 'Logo',
        profileName: 'User Name',
        profileEmail: 'email@example.com',
        menuChips: [
          MiniloHeaderMenuChip(icon: Icons.language_outlined),
          MiniloHeaderMenuChip(icon: Icons.notifications_none, badgeCount: 2),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/navigation/bottom-nav',
      group: 'Navigation',
      title: 'Bottom Nav Bar',
      previewSize: const Size(375, 56),
      builder: (_) => SizedBox(
        width: 375,
        child: MiniloBottomNavBar.defaultTabs(
          currentIndex: 1,
          onTap: (_) {},
        ),
      ),
    ),
    WidgetCatalogEntry(
      route: '/navigation/mobile-bottom-nav-atom',
      group: 'Navigation',
      title: 'Mobile Bottom Nav Atom',
      previewSize: const Size(375, 56),
      builder: (_) => const MiniloMobileBottomNavAtom(
        items: [
          MiniloMobileBottomNavAtomItem(
              icon: Icons.home_outlined, label: 'Home'),
          MiniloMobileBottomNavAtomItem(
              icon: Icons.search_outlined, label: 'Search'),
          MiniloMobileBottomNavAtomItem(
              icon: Icons.person_outline, label: 'Profile'),
          MiniloMobileBottomNavAtomItem(icon: Icons.more_horiz, label: 'More'),
        ],
        currentIndex: 1,
      ),
    ),
    WidgetCatalogEntry(
      route: '/tabs/top-tabs',
      group: 'Tabs',
      title: 'Top Tabs',
      previewSize: const Size(273, 48),
      builder: (_) => MiniloTopTabs(
        tabs: const ['Active Tab', 'In-Active Tab'],
        currentIndex: 0,
        onTap: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/tabs/tab-pills',
      group: 'Tabs',
      title: 'Tab Pills',
      previewSize: const Size(279, 40),
      builder: (_) => MiniloTabPills(
        tabs: const ['Active tab', 'In-Active Tab'],
        currentIndex: 0,
        onTap: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/tabs/primary-tabs',
      group: 'Tabs',
      title: 'Primary Tabs',
      previewSize: const Size(328, 48),
      builder: (_) => MiniloPrimaryTabs(
        tabs: const ['Primary Tab 1', 'Primary Tab 2'],
        currentIndex: 0,
        onTap: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/tabs/secondary-tabs',
      group: 'Tabs',
      title: 'Secondary Tabs',
      previewSize: const Size(328, 48),
      builder: (_) => MiniloSecondaryTabs(
        tabs: const ['Secondary Tab 1', 'Secondary Tab 2'],
        currentIndex: 0,
        onTap: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/tabs/side-tabs',
      group: 'Tabs',
      title: 'Side Tabs',
      previewSize: const Size(205, 280),
      builder: (_) => MiniloSideTabs(
        items: const [
          MiniloSideTabItemData(
            label: 'Heading 1',
            state: MiniloSideTabState.active,
            iconState: MiniloSideTabIconState.checked,
          ),
          MiniloSideTabItemData(
            label: 'Heading 2',
            state: MiniloSideTabState.inactive,
            iconState: MiniloSideTabIconState.checked,
          ),
          MiniloSideTabItemData(
            label: 'Heading 3',
            state: MiniloSideTabState.active,
            iconState: MiniloSideTabIconState.unchecked,
          ),
          MiniloSideTabItemData(
            label: 'Heading 4',
            state: MiniloSideTabState.inactive,
            iconState: MiniloSideTabIconState.unchecked,
          ),
        ],
        onTap: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/stepper/desktop',
      group: 'Stepper',
      title: 'Stepper Desktop',
      previewSize: const Size(720, 96),
      builder: (_) => SizedBox(
        width: 720,
        child: MiniloStepperDesktop(
          currentStep: 1,
          steps: const [
            MiniloStepData(title: 'Account', complete: true),
            MiniloStepData(title: 'Document', complete: false),
            MiniloStepData(title: 'Review', complete: false),
          ],
          onStepTap: (_) {},
        ),
      ),
    ),
    WidgetCatalogEntry(
      route: '/stepper/mobile',
      group: 'Stepper',
      title: 'Stepper Mobile',
      previewSize: const Size(375, 44),
      builder: (_) => const SizedBox(
        width: 375,
        child: MiniloStepperMobile(
          currentStep: 2,
          totalSteps: 5,
          title: 'Mobile Stepper For App',
        ),
      ),
    ),
    WidgetCatalogEntry(
      route: '/search/mobile-default',
      group: 'Search',
      title: 'Search Mobile (Default)',
      previewSize: const Size(343, 48),
      builder: (_) =>
          const MiniloSearchMobile(state: MiniloSearchMobileState.defaultState),
    ),
    WidgetCatalogEntry(
      route: '/search/mobile-typing',
      group: 'Search',
      title: 'Search Mobile (Typing)',
      previewSize: const Size(343, 48),
      builder: (_) =>
          const MiniloSearchMobile(state: MiniloSearchMobileState.typing),
    ),
    WidgetCatalogEntry(
      route: '/search/mobile-typed',
      group: 'Search',
      title: 'Search Mobile (Typed)',
      previewSize: const Size(343, 592),
      builder: (_) => const MiniloSearchMobile(
        state: MiniloSearchMobileState.typed,
        recentSearches: ['News', 'New York', 'Sensex', 'Claim'],
        popularSearches: ['Payslips', 'Account Settings', 'Privacy Policy'],
      ),
    ),
    WidgetCatalogEntry(
      route: '/pagination/web',
      group: 'Pagination',
      title: 'Web Pagination',
      previewSize: const Size(1097, 42),
      builder: (_) => MiniloWebPagination(
        page: 2,
        totalPages: 5,
        pageSize: 6,
        totalItems: 30,
        onPageChanged: (_) {},
        onPageSizeChanged: (_) {},
      ),
    ),
    WidgetCatalogEntry(
      route: '/layout/section-header',
      group: 'Layout',
      title: 'Section Header',
      previewSize: const Size(375, 156),
      builder: (_) => const SizedBox(
        width: 375,
        child: MiniloSectionHeader(
          eyebrow: 'Minilo Flutter',
          title: 'Section Header',
          description: 'Use this header to introduce blocks.',
        ),
      ),
    ),
    WidgetCatalogEntry(
      route: '/layout/page-footer',
      group: 'Layout',
      title: 'Page Footer',
      previewSize: const Size(375, 80),
      builder: (_) => const SizedBox(
        width: 375,
        child: MiniloPageFooter(
          title: 'Page Footer',
          subtitle: 'Footer helper text',
        ),
      ),
    ),
    WidgetCatalogEntry(
      route: '/layout/sidebar-tips-card',
      group: 'Layout',
      title: 'Sidebar Tips Card',
      previewSize: const Size(250, 232),
      builder: (_) => const MiniloSidebarTipsCard(
        title: 'Tips',
        items: [
          'Lorem ipsum dummy text to be replaced here.',
          'Another helper tip for users in this section.',
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/charts/pie-chart-card',
      group: 'Charts',
      title: 'Pie Chart Card',
      previewSize: const Size(343, 220),
      builder: (_) => const MiniloPieChartCard(
        title: 'Pie Chart',
        slices: [
          MiniloPieSlice(
              label: 'Approved', value: 62, color: Color(0xFF005A30)),
          MiniloPieSlice(label: 'Pending', value: 30, color: Color(0xFFF89707)),
          MiniloPieSlice(label: 'Rejected', value: 8, color: Color(0xFFD4351C)),
        ],
      ),
    ),
    WidgetCatalogEntry(
      route: '/containers/container-card',
      group: 'Containers',
      title: 'Container Card',
      previewSize: const Size(343, 260),
      builder: (_) => const MiniloContainerCard(),
    ),
    WidgetCatalogEntry(
      route: '/containers/sample-container-one',
      group: 'Containers',
      title: 'Sample Container One',
      previewSize: const Size(343, 320),
      builder: (_) => const MiniloSampleContainerOne(isLoading: false),
    ),
    WidgetCatalogEntry(
      route: '/more/accordion',
      group: 'More',
      title: 'Accordion',
      previewSize: const Size(343, 72),
      builder: (_) => const SizedBox(
        width: 343,
        child: MiniloAccordion(
          title: 'Accordion Title',
          child: Text('Accordion content'),
        ),
      ),
    ),
  ];
}
