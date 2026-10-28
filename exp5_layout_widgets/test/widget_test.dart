import 'package:flutter_test/flutter_test.dart';
import 'package:exp5_layout_widgets/main.dart';

void main() {
  testWidgets('shows the layout widget examples', (tester) async {
    await tester.pumpWidget(const LayoutWidgetsApp());

    expect(find.text('Flutter Layout Widgets'), findsOneWidget);
    expect(find.text('1. Container'), findsOneWidget);
    expect(find.text('4. Expanded'), findsOneWidget);
    expect(find.text('5. Stack'), findsOneWidget);
    expect(find.text('7. GridView'), findsOneWidget);
  });
}