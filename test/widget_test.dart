import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/main.dart';
import 'package:moviedb/screens/HomePage.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MovieDBApp());

    expect(find.byType(HomePage), findsOneWidget);
  });
}
