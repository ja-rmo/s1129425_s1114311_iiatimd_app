// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dovenlingo/main.dart';

void main() {
  testWidgets('Checks mainApp standard ui elements',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our counter starts at 0.
    expect(find.text('Dovenlingo'), findsAtLeastNWidgets(1));
    expect(find.text('Hoofdstuk 1'), findsAtLeastNWidgets(1));
  });
}
