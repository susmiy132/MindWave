import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/meditation/presentation/view/meditation_record_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('RecordingTimeScreen widget test', () {
    const testTitle = 'Test Meditation';
    const testDuration = '1 min'; // 1 minute = 60 seconds

    setUp(() async {
      // Clear shared preferences before each test
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('initial UI displays title, duration, and timer',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RecordingTimeScreen(
            title: testTitle,
            duration: testDuration,
          ),
        ),
      );

      expect(find.text('Meditation Recording'), findsOneWidget);
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text('Duration: $testDuration'), findsOneWidget);
      expect(find.text('01:00'), findsOneWidget); // initial timer value
      expect(find.text('Start Meditation'), findsOneWidget);
      expect(find.text('No completed meditations yet.'), findsOneWidget);
    });

    testWidgets('start meditation countdown and completes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RecordingTimeScreen(
            title: testTitle,
            duration: testDuration,
          ),
        ),
      );

      // Tap Start Meditation button
      await tester.tap(find.text('Start Meditation'));
      await tester.pump(); // Start timer

      // Timer should be running now, _remainingSeconds should decrease every second

      // Advance time by 1 second
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('00:59'), findsOneWidget);

      // Advance time by 58 more seconds to finish timer
      await tester.pump(const Duration(seconds: 58));
      expect(find.text('00:01'), findsOneWidget);

      // Advance last second to complete
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('00:00'), findsOneWidget);

      // SnackBar should appear
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('"$testTitle" meditation completed!'), findsOneWidget);

      // Wait for SnackBar to disappear (optional)
      await tester.pump(const Duration(seconds: 4));
    });

  //  testWidgets('meditation history updates after completion',
  //   (WidgetTester tester) async {
  // await tester.pumpWidget(
  //   MaterialApp(
  //     home: RecordingTimeScreen(
  //       title: testTitle,
  //       duration: testDuration,
  //     ),
  //   ),
  // );

  // // Start the meditation timer
  // await tester.tap(find.text('Start Meditation'));
  // await tester.pump();

  // // Fast-forward full duration + 1 second to finish timer
  // await tester.pump(const Duration(minutes: 1, seconds: 1));
  
  // // Let widget rebuilds, async SharedPreferences, and SnackBar complete
  // await tester.pumpAndSettle();

  // // Now the history list should contain the session
  // expect(find.text(testTitle), findsWidgets); // Meditation session title shown in list
  // expect(find.text('Duration: $testDuration'), findsWidgets);

  // // Verify delete button exists and tap it
  // expect(find.byIcon(Icons.delete), findsOneWidget);
  // await tester.tap(find.byIcon(Icons.delete));
  
  // await tester.pumpAndSettle();

  // // Snackbar should appear confirming deletion
  // expect(find.text('Meditation session deleted'), findsOneWidget);

  // // History list should be empty after deletion
  // expect(find.text('No completed meditations yet.'), findsOneWidget);
  // });
  });

}
