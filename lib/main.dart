import 'package:flutter/material.dart';

void main() => runApp(const VyroApp());

const _ink = Color(0xFF101116);
const _panel = Color(0xFF1A1B22);
const _muted = Color(0xFF92939F);
const _lime = Color(0xFFC7F36B);

class VyroApp extends StatelessWidget {
  const VyroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vyro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _ink,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _lime,
          brightness: Brightness.dark,
          surface: _panel,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _lime,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(Icons.cut_rounded, color: _ink),
                  ),
                  const SizedBox(width: 11),
                  const Text('vyro', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, letterSpacing: -1)),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined), tooltip: 'Settings'),
                  const CircleAvatar(radius: 18, backgroundColor: _panel, child: Icon(Icons.person_outline, size: 19)),
                ],
              ),
              const SizedBox(height: 34),
              const Text('Make something\nthat moves.', style: TextStyle(fontSize: 34, height: 1.05, fontWeight: FontWeight.w800, letterSpacing: -1.2)),
              const SizedBox(height: 11),
              const Text('Your stories, cut your way.', style: TextStyle(color: _muted, fontSize: 15)),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: _lime, foregroundColor: _ink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const EditorScreen())),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('New project', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 33),
              Row(
                children: [
                  const Text('Recent projects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: _lime))),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _ProjectCard(onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const EditorScreen()))),
                    const SizedBox(height: 12),
                    const _EmptyProjectCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _HomeNavigation(),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: _panel, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF8067FF), Color(0xFFEC8A72), Color(0xFFFFC56B)]),
              ),
              child: const Icon(Icons.play_arrow_rounded, size: 33, color: Colors.white),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Weekend moments', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                SizedBox(height: 7),
                Text('Edited just now  ·  00:24', style: TextStyle(color: _muted, fontSize: 12)),
              ]),
            ),
            const Icon(Icons.more_horiz, color: _muted),
          ],
        ),
      ),
    );
  }
}

class _EmptyProjectCard extends StatelessWidget {
  const _EmptyProjectCard();
  @override
  Widget build(BuildContext context) => Container(
    height: 92,
    alignment: Alignment.center,
    decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(18)),
    child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.video_library_outlined, color: _muted, size: 19), SizedBox(width: 9), Text('Your next idea starts here', style: TextStyle(color: _muted))]),
  );
}

class _HomeNavigation extends StatelessWidget {
  const _HomeNavigation();
  @override
  Widget build(BuildContext context) => NavigationBar(
    backgroundColor: _ink,
    indicatorColor: const Color(0xFF30351F),
    selectedIndex: 0,
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), label: 'Templates'),
      NavigationDestination(icon: Icon(Icons.folder_open_outlined), label: 'Projects'),
    ],
  );
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
  final _tools = const [
    (Icons.content_cut_rounded, 'Edit'),
    (Icons.music_note_rounded, 'Audio'),
    (Icons.title_rounded, 'Text'),
    (Icons.auto_awesome_rounded, 'Effects'),
    (Icons.filter_vintage_rounded, 'Filters'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _ink,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Weekend moments', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)), Text('1080p  ·  30 fps', style: TextStyle(fontSize: 11, color: _muted))]),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.undo_rounded), tooltip: 'Undo'),
          IconButton(onPressed: () {}, icon: const Icon(Icons.redo_rounded), tooltip: 'Redo'),
          Padding(padding: const EdgeInsets.only(right: 12), child: FilledButton(onPressed: () {}, style: FilledButton.styleFrom(backgroundColor: _lime, foregroundColor: _ink), child: const Text('Export', style: TextStyle(fontWeight: FontWeight.w800)))),
        ],
      ),
      body: Column(
        children: [
          Expanded(flex: 5, child: _preview()),
          _transport(),
          _timeline(),
          _toolTray(),
        ],
      ),
    );
  }

  Widget _preview() => Container(
    width: double.infinity,
    margin: const EdgeInsets.fromLTRB(18, 8, 18, 10),
    decoration: BoxDecoration(color: const Color(0xFF23242B), borderRadius: BorderRadius.circular(18)),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: DecoratedBox(
              decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFF534A78), Color(0xFFB36B62), Color(0xFFE2A765)])),
              child: Stack(children: [
                Positioned(right: -40, top: 28, child: _orb(150, const Color(0xFFFFD18B).withValues(alpha: .5))),
                Positioned(left: -30, bottom: 20, child: _orb(120, const Color(0xFFB8A7FF).withValues(alpha: .45))),
                const Center(child: Icon(Icons.landscape_rounded, color: Colors.white54, size: 105)),
              ]),
            ),
          ),
        ),
        Container(width: 52, height: 52, decoration: BoxDecoration(color: Colors.black.withValues(alpha: .36), shape: BoxShape.circle), child: IconButton(onPressed: () => setState(() => _playing = !_playing), icon: Icon(_playing ? Icons.pause_rounded : Icons.play_arrow_rounded, size: 30, color: Colors.white))),
        const Positioned(bottom: 12, right: 12, child: Text('PREVIEW', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1.4))),
      ],
    ),
  );

  Widget _orb(double size, Color color) => Container(width: size, height: size, decoration: BoxDecoration(color: color, shape: BoxShape.circle));

  Widget _transport() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    child: Row(children: [
      const Text('00:08.2', style: TextStyle(fontFeatures: [], fontSize: 13, fontWeight: FontWeight.w700)),
      const Text('  /  00:24.0', style: TextStyle(color: _muted, fontSize: 12)),
      const Spacer(),
      IconButton(onPressed: () {}, icon: const Icon(Icons.aspect_ratio_rounded, size: 20), tooltip: 'Canvas ratio'),
      IconButton(onPressed: () {}, icon: const Icon(Icons.fullscreen_rounded, size: 20), tooltip: 'Full screen'),
    ]),
  );

  Widget _timeline() => Container(
    height: 164,
    margin: const EdgeInsets.fromLTRB(16, 5, 16, 0),
    padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
    decoration: BoxDecoration(color: _panel, borderRadius: BorderRadius.circular(16)),
    child: Column(children: [
      Row(children: [const Text('00:00', style: TextStyle(color: _muted, fontSize: 10)), Expanded(child: Slider(value: _position, onChanged: (v) => setState(() => _position = v), activeColor: _lime, inactiveColor: Colors.white12)), const Text('00:24', style: TextStyle(color: _muted, fontSize: 10))]),
      Expanded(child: Stack(children: [
        Column(children: [
          SizedBox(height: 54, child: Row(children: [
            _clip(const Color(0xFF8073B8), 'CLIP 01'), const SizedBox(width: 3), _clip(const Color(0xFFBA796A), 'CLIP 02'), const SizedBox(width: 3), _clip(const Color(0xFF8A9B68), 'CLIP 03'),
            Container(width: 28, height: 48, decoration: BoxDecoration(color: const Color(0xFF252630), borderRadius: BorderRadius.circular(6)), child: const Icon(Icons.add, size: 17, color: _muted)),
          ])),
          const SizedBox(height: 8),
          Container(height: 28, decoration: BoxDecoration(color: const Color(0xFF253229), borderRadius: BorderRadius.circular(6)), child: const Row(children: [SizedBox(width: 8), Icon(Icons.graphic_eq_rounded, size: 15, color: _lime), SizedBox(width: 6), Text('Original audio', style: TextStyle(color: _lime, fontSize: 10)), Spacer(), Icon(Icons.more_horiz, size: 16, color: _lime), SizedBox(width: 7)])),
        ]),
        Positioned(left: 103, top: 0, bottom: 0, child: Container(width: 2, color: _lime)),
      ])),
    ]),
  );

  Widget _clip(Color color, String label) => Expanded(child: Container(height: 48, alignment: Alignment.centerLeft, padding: const EdgeInsets.symmetric(horizontal: 6), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)), child: Row(children: [const Icon(Icons.image_rounded, size: 14, color: Colors.white70), const SizedBox(width: 4), Flexible(child: Text(label, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700)))])));

  Widget _toolTray() => SizedBox(
    height: 92,
    child: ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 14),
      scrollDirection: Axis.horizontal,
      itemCount: _tools.length,
      separatorBuilder: (_, __) => const SizedBox(width: 7),
      itemBuilder: (context, index) {
        final (icon, label) = _tools[index];
        final selected = _tool == label;
        return InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => setState(() => _tool = label),
          child: Container(width: 70, decoration: BoxDecoration(color: selected ? const Color(0xFF30351F) : _panel, borderRadius: BorderRadius.circular(14), border: selected ? Border.all(color: _lime.withValues(alpha: .45)) : null), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: selected ? _lime : Colors.white70, size: 20), const SizedBox(height: 5), Text(label, style: TextStyle(fontSize: 10, color: selected ? _lime : Colors.white70))])),
        );
      },
    ),
  );
}
