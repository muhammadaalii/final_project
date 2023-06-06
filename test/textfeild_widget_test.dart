import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/widgets/reusable_widget.dart';

void main() {
  testWidgets('reusableTextField Widget Test', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: reusableTextField(
            'Email',
            Icons.email,
            false,
            controller,
          ),
        ),
      ),
    );

    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'example@example.com');

    expect(controller.text, 'example@example.com');
  });
}