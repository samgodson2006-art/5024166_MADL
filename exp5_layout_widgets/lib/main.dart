import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutWidgetsApp());
}

class LayoutWidgetsApp extends StatelessWidget {
  const LayoutWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LayoutWidgetsScreen(),
    );
  }
}

class LayoutWidgetsScreen extends StatelessWidget {
  const LayoutWidgetsScreen({super.key});

  Widget _sectionHeading(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Layout Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Arrange, size, and layer widgets to build a responsive interface.',
            ),
            _sectionHeading('1. Container'),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Padding, color, and decoration in one box.'),
            ),
            _sectionHeading('2. Row'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, size: 32),
                Icon(Icons.favorite, size: 32),
                Icon(Icons.settings, size: 32),
              ],
            ),
            _sectionHeading('3. Column'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First child'),
                SizedBox(height: 6),
                Text('Second child'),
              ],
            ),
            _sectionHeading('4. Expanded'),
            SizedBox(
              height: 72,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ColoredBox(
                      color: colorScheme.secondaryContainer,
                      child: Center(child: Text('1 part')),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ColoredBox(
                      color: colorScheme.tertiaryContainer,
                      child: Center(child: Text('2 parts')),
                    ),
                  ),
                ],
              ),
            ),
            _sectionHeading('5. Stack'),
            SizedBox(
              height: 112,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('Background layer')),
                  ),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Chip(label: Text('Overlay')),
                  ),
                ],
              ),
            ),
            _sectionHeading('6. Wrap'),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text('One')),
                Chip(label: Text('Two')),
                Chip(label: Text('Three')),
                Chip(label: Text('Moves to the next line')),
              ],
            ),
            _sectionHeading('7. GridView'),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3,
              children: List.generate(
                4,
                (index) => ColoredBox(
                  color: index.isEven
                      ? colorScheme.secondaryContainer
                      : colorScheme.tertiaryContainer,
                  child: Center(child: Text('Cell ${index + 1}')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}