// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/features/moodtracker/presentation/view/mood_tracker_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() async {
//     // Clear any previous SharedPreferences values
//     SharedPreferences.setMockInitialValues({});
//   });

//   testWidgets('Displays mood options and selects one', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(home: MoodTrackerViewScreen()),
//     );

//     // Check heading
//     expect(find.text("How are you feeling today?"), findsOneWidget);

//     // Find a mood label to tap (e.g., Happy)
//     final happyFinder = find.text("Happy");
//     expect(happyFinder, findsOneWidget);

//     await tester.tap(happyFinder);
//     await tester.pump(); // rebuild after setState

//     // SnackBar appears after mood selection
//     expect(find.text("Mood 'Happy' recorded!"), findsOneWidget);
//   });

//   testWidgets('Mood history list initially shows no moods', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(home: MoodTrackerViewScreen()),
//     );

//     expect(find.text("No moods tracked yet."), findsOneWidget);
//   });

//   testWidgets('Add and delete mood - integration', (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(home: MoodTrackerViewScreen()));

//     // Select a mood
//     await tester.tap(find.text("Happy"));
//     await tester.pump(); // rebuild for snackbar
//     await tester.pump(const Duration(seconds: 2)); // allow snackbar to disappear

//     // Check it's added to mood history
//     await tester.pump(); // for mood history update
//     expect(find.text("Happy"), findsWidgets); // one in mood button, one in list

//     // Tap delete button (should show delete icon)
//     final deleteButton = find.byIcon(Icons.delete).first;
//     expect(deleteButton, findsOneWidget);
//     await tester.tap(deleteButton);
//     await tester.pump(); // apply deletion
//     expect(find.text("Happy"), findsOneWidget); // Only the mood option remains
//   });

//   testWidgets('Edit mood opens dialog and updates', (WidgetTester tester) async {
//     await tester.pumpWidget(const MaterialApp(home: MoodTrackerViewScreen()));

//     // Add mood
//     await tester.tap(find.text("Happy"));
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 2));

//     // Tap edit button
//     await tester.tap(find.byIcon(Icons.edit));
//     await tester.pumpAndSettle();

//     // Check dialog shows up
//     expect(find.text("Edit Mood"), findsOneWidget);
//     expect(find.text("Emoji"), findsOneWidget);
//     expect(find.text("Label"), findsOneWidget);

//     // Update label to "Relaxed"
//     await tester.enterText(find.byType(TextField).last, "Relaxed");
//     await tester.tap(find.text("Update"));
//     await tester.pump(); // apply update

//     expect(find.text("Relaxed"), findsWidgets);
//   });
// }
