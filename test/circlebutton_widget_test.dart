import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/widgets/circle_button.dart';

void main() {
  testWidgets('CircleButton Widget Test', (WidgetTester tester) async {
    const IconData testIcon = Icons.add;
    const double testIconSize = 24.0;
    bool isButtonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircleButton(
              icon: testIcon,
              iconSize: testIconSize,
              onPressed: () {
                isButtonPressed = true;
              },
            ),
          ),
        ),
      ),
    );

    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);

    await tester.tap(iconButtonFinder);
    await tester.pump();

    expect(isButtonPressed, true);
  });
}
