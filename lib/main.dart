import 'package:flutter/material.dart';

void main() => runApp(const VyroApp());

const _ink = Color(0xFF050505);
const _panel = Color(0xFF121212);
const _panel2 = Color(0xFF1B1B1B);
const _gold = Color(0xFFFFD700);
const _muted = Color(0xFFA7A7A7);

class VyroApp extends StatelessWidget {
  const VyroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vyro Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _ink,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _gold,
          brightness: Brightness.dark,
          surface: _panel,
        ),
        useMaterial3: true,
      ),
      home: const VyroHome(),
    );
  }
}

class VyroHome extends StatefulWidget {
  const VyroHome({super.key});

  @override
  State<VyroHome> createState() => _VyroHomeState();
}

class _VyroHomeState extends State<VyroHome> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const TemplatesScreen(),
      const ProjectsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: _ink,
        indicatorColor: _gold.withValues(alpha: 0.16),
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'Templates'),
          NavigationDestination(icon: Icon(Icons.folder_open_outlined), selectedIcon: Icon(Icons.folder_rounded), label: 'Projects'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 24),
        children: [
          Row(children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(color: _gold, borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.play_arrow_rounded, color: _ink, size: 28),
            ),
            const SizedBox(width: 11),
            const Text('VYRO', style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900, letterSpacing: 3)),
            const Spacer(),
            IconButton(onPressed: () => _showSheet(context, 'Notifications', 'No new notifications'), icon: const Icon(Icons.notifications_none_rounded)),
            IconButton(onPressed: () => _showSheet(context, 'Search', 'Search projects and templates'), icon: const Icon(Icons.search_rounded)),
          ]),
          const SizedBox(height: 28),
          const Text('Create without limits', style: TextStyle(fontSize: 32, height: 1.05, fontWeight: FontWeight.w900, letterSpacing: -1.2)),
          const SizedBox(height: 9),
          const Text('Plans change quality. Creation is for everyone.', style: TextStyle(color: _muted, fontSize: 14)),
          const SizedBox(height: 22),
          SizedBox(
            height: 58,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: _gold, foregroundColor: _ink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditorScreen())),
              icon: const Icon(Icons.add_rounded),
              label: const Text('New project', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
            ),
          ),
          const SizedBox(height: 28),
          const SectionTitle(title: 'Quick create'),
          const SizedBox(height: 12),
          Row(children: const [
            Expanded(child: _QuickCard(icon: Icons.video_library_outlined, title: 'Import', color: Color(0xFF8057C8))),
            SizedBox(width: 10),
            Expanded(child: _QuickCard(icon: Icons.mic_none_rounded, title: 'Record', color: Color(0xFFB96A62))),
            SizedBox(width: 10),
            Expanded(child: _QuickCard(icon: Icons.auto_awesome_rounded, title: 'Aura', color: Color(0xFFD4A914))),
          ]),
          const SizedBox(height: 28),
          const SectionTitle(title: 'Recent projects'),
          const SizedBox(height: 12),
          const _ProjectTile(title: 'Weekend moments', subtitle: 'Edited just now · 00:24', gradient: [Color(0xFF8067FF), Color(0xFFEC8A72), Color(0xFFFFC56B)]),
          const SizedBox(height: 10),
          const _ProjectTile(title: 'Nigerian skies', subtitle: 'Yesterday · 00:18', gradient: [Color(0xFF22546C), Color(0xFF73A79A), Color(0xFFD6B64C)]),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Row(children: [
    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
    const Spacer(),
    TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: _gold))),
  ]);
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({required this.icon, required this.title, required this.color});
  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    height: 98,
    decoration: BoxDecoration(color: _panel, borderRadius: BorderRadius.circular(16)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 44, height: 44, decoration: BoxDecoration(color: color.withValues(alpha: 0.18), shape: BoxShape.circle), child: Icon(icon, color: color)),
      const SizedBox(height: 8),
      Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
    ]),
  );
}

class _ProjectTile extends StatelessWidget {
  const _ProjectTile({required this.title, required this.subtitle, required this.gradient});
  final String title;
  final String subtitle;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditorScreen())),
    child: Ink(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: _panel, borderRadius: BorderRadius.circular(18)),
      child: Row(children: [
        Container(width: 76, height: 76, decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), gradient: LinearGradient(colors: gradient)), child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 34)),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)), const SizedBox(height: 7), Text(subtitle, style: const TextStyle(color: _muted, fontSize: 12))])),
        const Icon(Icons.more_horiz, color: _muted),
      ]),
    ),
  );
}

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(18), children: [
    const Text('Templates', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    const SizedBox(height: 16),
    TextField(decoration: InputDecoration(hintText: 'Search templates', filled: true, fillColor: _panel, prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none))),
    const SizedBox(height: 20),
    ...['Cinematic', 'Social Reels', 'Celebration', 'Travel'].map((name) => Padding(padding: const EdgeInsets.only(bottom: 12), child: Container(height: 150, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: _panel, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white10)), child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)), const SizedBox(height: 6), const Text('Original editable template', style: TextStyle(color: _muted))])), const Icon(Icons.arrow_forward_ios_rounded, color: _gold, size: 18)])))),
  ]));
}

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(18), children: const [
    Text('Projects', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    SizedBox(height: 18),
    _ProjectTile(title: 'Weekend moments', subtitle: 'Draft · 00:24', gradient: [Color(0xFF8067FF), Color(0xFFEC8A72), Color(0xFFFFC56B)]),
    SizedBox(height: 12),
    _ProjectTile(title: 'Nigerian skies', subtitle: 'Draft · 00:18', gradient: [Color(0xFF22546C), Color(0xFF73A79A), Color(0xFFD6B64C)]),
  ]));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(child: ListView(padding: const EdgeInsets.all(18), children: [
    const CircleAvatar(radius: 38, backgroundColor: _gold, child: Icon(Icons.person_rounded, color: _ink, size: 42)),
    const SizedBox(height: 12),
    const Center(child: Text('Creator', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900))),
    const SizedBox(height: 4),
    const Center(child: Text('Guest mode', style: TextColorExtension.muted)),
    const SizedBox(height: 26),
    ...['Account', 'Privacy', 'Notifications', 'Storage', 'Export defaults', 'Help & legal'].map((name) => Card(color: _panel, margin: const EdgeInsets.only(bottom: 8), child: ListTile(leading: const Icon(Icons.chevron_right_rounded, color: _gold), title: Text(name), trailing: const Icon(Icons.chevron_right_rounded, size: 18)))),
  ]));
}

void _showSheet(BuildContext context, String title, String message) {
  showModalBottomSheet<void>(context: context, backgroundColor: _panel, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))), builder: (_) => Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)), const SizedBox(height: 8), Text(message, style: const TextStyle(color: _muted))])));
}

class TextColorExtension {
  static const TextStyle muted = TextStyle(color: _muted);
}

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  bool _playing = false;
  String _tool = 'Edit';
  double _position = 0.34;

  @override
  Widget build(BuildContext context) {
    final tools = const [('content_cut', 'Edit'), ('music_note', 'Audio'), ('title', 'Text'), ('auto_awesome', 'Effects'), ('filter_vintage', 'Filters')];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _ink,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Weekend moments', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)), Text('1080p · 30 fps', style: TextStyle(fontSize: 11, color: _muted))]),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.undo_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.redo_rounded)),
          Padding(padding: const EdgeInsets.only(right: 12), child: FilledButton(onPressed: () => _showSheet(context, 'Export', 'Export options will appear when a media pipeline is configured.'), style: FilledButton.styleFrom(backgroundColor: _gold, foregroundColor: _ink), child: const Text('Export'))),
        ],
      ),
      body: Column(children: [
        Expanded(flex: 5, child: Container(margin: const EdgeInsets.fromLTRB(18, 8, 18, 10), decoration: BoxDecoration(color: _panel2, borderRadius: BorderRadius.circular(18)), child: Stack(alignment: Alignment.center, children: [
          Positioned.fill(child: ClipRRect(borderRadius: BorderRadius.circular(18), child: const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF534A78), Color(0xFFB36B62), Color(0xFFE2A765)])), child: Center(child: Icon(Icons.landscape_rounded, color: Colors.white54, size: 105))))),
          Container(width: 52, height: 52, decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle), child: IconButton(onPressed: () => setState(() => _playing = !_playing), icon: Icon(_playing ? Icons.pause_rounded : Icons.play_arrow_rounded))),
          const Positioned(bottom: 12, right: 12, child: Text('PREVIEW', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.4))),
        ]))),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Row(children: [const Text('00:08.2', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)), const Text(' / 00:24.0', style: TextStyle(color: _muted, fontSize: 12)), const Spacer(), IconButton(onPressed: () {}, icon: const Icon(Icons.aspect_ratio_rounded, size: 20))])),
        Container(height: 164, margin: const EdgeInsets.fromLTRB(16, 5, 16, 0), padding: const EdgeInsets.fromLTRB(12, 8, 12, 6), decoration: BoxDecoration(color: _panel, borderRadius: BorderRadius.circular(16)), child: Column(children: [Row(children: [const Text('00:00', style: TextStyle(color: _muted, fontSize: 10)), Expanded(child: Slider(value: _position, onChanged: (value) => setState(() => _position = value), activeColor: _gold)), const Text('00:24', style: TextStyle(color: _muted, fontSize: 10))]), Expanded(child: Stack(children: [Column(children: [SizedBox(height: 54, child: Row(children: const [Expanded(child: _Clip(color: Color(0xFF8073B8), label: 'CLIP 01')), SizedBox(width: 3), Expanded(child: _Clip(color: Color(0xFFBA796A), label: 'CLIP 02')), SizedBox(width: 3), Expanded(child: _Clip(color: Color(0xFF8A9B68), label: 'CLIP 03'))])), const SizedBox(height: 8), Container(height: 28, decoration: BoxDecoration(color: const Color(0xFF253229), borderRadius: BorderRadius.circular(6)), child: const Row(children: [SizedBox(width: 8), Icon(Icons.graphic_eq_rounded, size: 16, color: _gold), SizedBox(width: 8), Text('MUSIC TRACK', style: TextStyle(fontSize: 10, color: _muted))]))]), Positioned(left: 103, top: 0, bottom: 0, child: Container(width: 2, color: _gold))]))]),
        SizedBox(height: 92, child: ListView.separated(padding: const EdgeInsets.fromLTRB(12, 10, 12, 14), scrollDirection: Axis.horizontal, itemCount: tools.length, separatorBuilder: (_, __) => const SizedBox(width: 7), itemBuilder: (_, index) {
          final label = tools[index].$2;
          final selected = _tool == label;
          final icons = [Icons.content_cut_rounded, Icons.music_note_rounded, Icons.title_rounded, Icons.auto_awesome_rounded, Icons.filter_vintage_rounded];
          return InkWell(onTap: () => setState(() => _tool = label), borderRadius: BorderRadius.circular(14), child: Container(width: 70, decoration: BoxDecoration(color: selected ? _gold.withValues(alpha: 0.16) : _panel, borderRadius: BorderRadius.circular(14), border: selected ? Border.all(color: _gold) : null), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icons[index], color: selected ? _gold : _muted, size: 21), const SizedBox(height: 6), Text(label, style: TextStyle(fontSize: 11, color: selected ? _gold : _muted))])));
        }),
      ]),
    );
  }
}

class _Clip extends StatelessWidget {
  const _Clip({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) => Container(height: 48, alignment: Alignment.centerLeft, padding: const EdgeInsets.symmetric(horizontal: 6), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)), child: Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Colors.white70)));
}
