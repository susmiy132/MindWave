// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive/hive.dart';
// import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';
// import 'package:uuid/uuid.dart';
// import 'package:mocktail/mocktail.dart';


// class MockBox extends Mock implements Box<JournalHiveModel> {}

// void main() {
//   late MockBox mockBox;

//   setUp(() {
//     mockBox = MockBox();

//     // Setup mocks for Hive box behavior
//     when(() => mockBox.put(any(), any())).thenAnswer((_) async => Future.value());
//   });

//   Widget loadSaveJournalScreen() {
//     return MaterialApp(
//     );
//   }

//   testWidgets('SaveJournalScreen form validation and save flow', (tester) async {
//     await tester.pumpWidget(loadSaveJournalScreen());
//     await tester.pumpAndSettle();

//     // Find Save button
//     final saveButtonFinder = find.widgetWithText(ElevatedButton, 'Save Entry');
//     expect(saveButtonFinder, findsOneWidget);

//     // Tap Save without filling form (expect validation error)
//     await tester.tap(saveButtonFinder);
//     await tester.pump(); // start frame
//     await tester.pump(const Duration(seconds: 1)); // allow SnackBar

//     expect(find.text('Please fill all required fields'), findsOneWidget);

//     // Fill text fields
//     await tester.enterText(find.byType(TextFormField).at(0), 'Test Title');
//     await tester.enterText(find.byType(TextFormField).at(1), 'Test Place');
//     await tester.enterText(find.byType(TextFormField).at(2), 'Test Content');

//     // Tap Save again
//     await tester.tap(saveButtonFinder);
//     await tester.pump();
//     await tester.pump(const Duration(seconds: 1));

//     // Success snackbar should appear
//     expect(find.text('Journal saved!'), findsOneWidget);
//   });
// }
