import 'package:flutter_test/flutter_test.dart';
import 'package:moviedb/MovieDBApp.dart';
import 'package:moviedb/views/LoginView.dart';

void main() {
  testWidgets('LoginView loads on page load', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MovieDBApp());

    expect(find.byType(LoginView), findsOneWidget);
  });
}
