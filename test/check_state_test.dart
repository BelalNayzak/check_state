import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:check_state/check_state.dart';

void main() {
  // test('adds one to input values', () {
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  // });
  testWidgets('CheckState should show default error widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      CheckState(
        isError: true,
        isLoading: false,
        child: const Text('data'),
      ),
    );
    expect(find.byType(DefaultErr), findsOneWidget);
  });

  testWidgets('CheckState should show default loader widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      CheckState(
        isError: false,
        isLoading: true,
        child: SizedBox(),
      ),
    );
    expect(find.byType(DefaultLoader), findsOneWidget);
  });

  testWidgets('CheckState should show custom error widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      CheckState(
        isError: true,
        isLoading: false,
        child: SizedBox(),
        customErrWidget: Icon(Icons.error),
      ),
    );
    expect(find.byIcon(Icons.error), findsOneWidget);
  });

  testWidgets('CheckState should show custom loader widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      CheckState(
        isError: false,
        isLoading: true,
        child: SizedBox(),
        customLoaderWidget: Icon(Icons.refresh),
      ),
    );
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });

  testWidgets('CheckState should show success widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      CheckState(
        isError: false,
        isLoading: false,
        child: Icon(Icons.check),
      ),
    );
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('Checks if the retry ui works properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      CheckState(
        isError: true,
        isLoading: false,
        child: const Icon(Icons.check),
        canRetry: true,
        onClickRetry: () {
          print('Retrying');
        },
      ),
    );
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });

  testWidgets('Checks if the retry function works properly', (WidgetTester tester) async {
    var wasCalled = false;
    await tester.pumpWidget(
      CheckState(
        isError: true,
        isLoading: false,
        child: const Icon(Icons.check),
        canRetry: true,
        onClickRetry: () {
          wasCalled = true;
          print('Retrying');
        },
      ),
    );

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pumpAndSettle();

    expect(wasCalled, true);
  });
}
