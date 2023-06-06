import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/widgets/reusable_widget.dart';

class MockBuildContext extends StatelessWidget {
  const MockBuildContext({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          body: child,
        ),
      );
    });
  }
}

void main() {
  testWidgets('signInSignUpButton Widget Test', (WidgetTester tester) async {
    bool isButtonTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return signInSignUpButton(
              context,
              true,
              () {
                isButtonTapped = true;
              },
            );
          },
        ),
      ),
    );

    final elevatedButtonFinder = find.byType(ElevatedButton);
    expect(elevatedButtonFinder, findsOneWidget);

    await tester.tap(elevatedButtonFinder);
    await tester.pump();

    expect(isButtonTapped, true);
  });
}