import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_states_provider/main.dart';
import 'package:flutter_states_provider/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: const MyApp(),
      ),
    );

    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('1'), findsNothing);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Incrementar'));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}