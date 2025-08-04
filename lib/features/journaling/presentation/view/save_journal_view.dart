

// // // // import 'package:flutter/material.dart';

// // // // class SaveViewScreen extends StatelessWidget {
// // // //   final String journalContent;
// // // //   final String weather;

// // // //   const SaveViewScreen({
// // // //     Key? key,
// // // //     required this.journalContent,
// // // //     required this.weather,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Saved Journal Entry'),
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Text(
// // // //               'Weather: $weather',
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// // // //             ),
// // // //             SizedBox(height: 12),
// // // //             Text(
// // // //               'Journal Content:',
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
// // // //             ),
// // // //             SizedBox(height: 8),
// // // //             Container(
// // // //               padding: EdgeInsets.all(12),
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.grey[200],
// // // //                 borderRadius: BorderRadius.circular(8),
// // // //               ),
// // // //               child: Text(
// // // //                 journalContent,
// // // //                 style: TextStyle(fontSize: 16),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';

// // // class SaveViewScreen extends StatelessWidget {
// // //   final String journalTitle;
// // //   final String place;
// // //   final DateTime date;
// // //   final String weather;
// // //   final String journalContent;

// // //   final VoidCallback? onUpdate;
// // //   final VoidCallback? onDelete;

// // //   const SaveViewScreen({
// // //     Key? key,
// // //     required this.journalTitle,
// // //     required this.place,
// // //     required this.date,
// // //     required this.weather,
// // //     required this.journalContent,
// // //     this.onUpdate,
// // //     this.onDelete,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     String formattedDate = "${date.day}/${date.month}/${date.year}";

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Saved Journal Entry'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text('Title: $journalTitle',
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
// // //             SizedBox(height: 8),
// // //             Text('Place: $place',
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// // //             SizedBox(height: 8),
// // //             Text('Date: $formattedDate',
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// // //             SizedBox(height: 8),
// // //             Text('Weather: $weather',
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// // //             SizedBox(height: 16),
// // //             Text(
// // //               'Journal Content:',
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // //             ),
// // //             SizedBox(height: 8),
// // //             Container(
// // //               width: double.infinity,
// // //               padding: EdgeInsets.all(12),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.grey[200],
// // //                 borderRadius: BorderRadius.circular(8),
// // //               ),
// // //               child: Text(
// // //                 journalContent,
// // //                 style: TextStyle(fontSize: 16),
// // //               ),
// // //             ),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //               children: [
// // //                 ElevatedButton.icon(
// // //                   onPressed: onUpdate,
// // //                   icon: Icon(Icons.edit),
// // //                   label: Text('Update'),
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.blue,
// // //                   ),
// // //                 ),
// // //                 ElevatedButton.icon(
// // //                   onPressed: onDelete,
// // //                   icon: Icon(Icons.delete),
// // //                   label: Text('Delete'),
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.red,
// // //                   ),
// // //                 ),
// // //               ],
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';

// // class SaveViewScreen extends StatelessWidget {
// //   final String journalId;         // UNIQUE ID for identifying the journal
// //   final String journalTitle;
// //   final String place;
// //   final String journalContent;
// //   final String weather;
// //   final DateTime date;
// //   final String journalMood;
// //   final File journalImage;       // <-- Added this

// //   const SaveViewScreen({
// //     Key? key,
// //     required this.journalId,
// //     required this.journalTitle,
// //     required this.place,
// //     required this.journalContent,
// //     required this.weather,
// //     required this.date,
// //     required this.journalMood,
// //     required this.journalImage,    // <-- Added this
// //   }) : super(key: key);
  
// //   get selectedImageFile => null;

// //   Future<void> _deleteJournal(BuildContext context) async {
// //     final box = Hive.box<JournalHiveModel>('journals');

// //     final Map<dynamic, JournalHiveModel> journalsMap = box.toMap();
// //     dynamic keyToDelete;

// //     journalsMap.forEach((key, journal) {
// //       if (journal.journalId == journalId) {
// //         keyToDelete = key;
// //       }
// //     });

// //     if (keyToDelete != null) {
// //       await box.delete(keyToDelete);
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Journal deleted successfully!')),
// //       );
// //       Navigator.of(context).pop(); // Go back after deletion
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Journal not found!')),
// //       );
// //     }
// //   }

// //   Future<void> _updateJournal(BuildContext context, selectedImageFile) async {
// //     final box = Hive.box<JournalHiveModel>('journals');

// //     final Map<dynamic, JournalHiveModel> journalsMap = box.toMap();
// //     dynamic keyToUpdate;

// //     journalsMap.forEach((key, journal) {
// //       if (journal.journalId == journalId) {
// //         keyToUpdate = key;
// //       }
// //     });

// //     if (keyToUpdate != null) {
// //       final updatedJournal = JournalHiveModel(
// //         journalId: journalId,
// //         journalTitle: journalTitle,
// //         place: place,
// //         journalContent: journalContent,
// //         weather: weather,
// //         dateTime: date,
// //         journalmood: journalMood,
// //         journalImage: selectedImageFile.path,   // Use the field here
// //       );

// //       await box.put(keyToUpdate, updatedJournal);

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Journal updated successfully!')),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Journal not found!')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Saved Journal Entry'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text('Title: $journalTitle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
// //             SizedBox(height: 8),
// //             Text('Place: $place', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
// //             SizedBox(height: 8),
// //             Text('Date: ${date.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
// //             SizedBox(height: 12),
// //             Text('Weather: $weather', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
// //             SizedBox(height: 12),
// //             Text('Mood: $journalMood', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)), // Show mood
// //             SizedBox(height: 12),
// //             Text('Journal Content:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
// //             SizedBox(height: 8),
// //             Container(
// //               padding: EdgeInsets.all(12),
// //               decoration: BoxDecoration(
// //                 color: Colors.grey[200],
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: Text(journalContent, style: TextStyle(fontSize: 16)),
// //             ),
// //             Spacer(),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 ElevatedButton(
// //                   onPressed: () => _updateJournal(context, selectedImageFile),
// //                   child: Text('Update'),
// //                 ),
                
// //                 ElevatedButton(
// //                   onPressed: () => _deleteJournal(context),
// //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
// //                   child: Text('Delete'),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:mindwave/features/journaling/data/model/journal_hive_model.dart';
// import 'package:mindwave/features/journaling/presentation/view/delete_view_screen.dart';
// import 'package:mindwave/features/journaling/presentation/view/journal_view.dart';

// class SaveViewScreen extends StatelessWidget {
//   final String journalId;
//   final String journalTitle;
//   final String place;
//   final String journalContent;
//   final String weather;
//   final DateTime date;
//   final String journalMood;
//   final String journalImage;

//   const SaveViewScreen({
//     Key? key,
//     required this.journalId,
//     required this.journalTitle,
//     required this.place,
//     required this.journalContent,
//     required this.weather,
//     required this.date,
//     required this.journalMood,
//     required this.journalImage,
//   }) : super(key: key);

//   // Future<void> _deleteJournal(BuildContext context) async {
//   //   final box = Hive.box<JournalHiveModel>('journals');
//   //   final Map<dynamic, JournalHiveModel> journalsMap = box.toMap();
//   //   dynamic keyToDelete;

//   //   journalsMap.forEach((key, journal) {
//   //     if (journal.journalId == journalId) {
//   //       keyToDelete = key;
//   //     }
//   //   });

//   //   if (keyToDelete != null) {
//   //     await box.delete(keyToDelete);
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Journal deleted successfully!')),
//   //     );
//   //     Navigator.of(context).pop();
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Journal not found!')),
//   //     );
//   //   }
//   // }

//   Future<void> _deleteJournal(BuildContext context, String journalId) async {
//   final box = Hive.box<JournalHiveModel>('journals');
//   final Map<dynamic, JournalHiveModel> journalsMap = box.toMap();
//   dynamic keyToDelete;

//   journalsMap.forEach((key, journal) {
//     if (journal.journalId == journalId) {
//       keyToDelete = key;
//     }
//   });

//   if (keyToDelete != null) {
//     await box.delete(keyToDelete);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Journal deleted successfully!')),
//     );
//     Navigator.of(context).pop();
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Journal not found!')),
//     );
//   }
// }


//   Future<void> _updateJournal(BuildContext context) async {
//     final box = Hive.box<JournalHiveModel>('journals');
//     final Map<dynamic, JournalHiveModel> journalsMap = box.toMap();
//     dynamic keyToUpdate;

//     journalsMap.forEach((key, journal) {
//       if (journal.journalId == journalId) {
//         keyToUpdate = key;
//       }
//     });

//     if (keyToUpdate != null) {
//       final updatedJournal = JournalHiveModel(
//         journalId: journalId,
//         journalTitle: journalTitle,
//         place: place,
//         journalContent: journalContent,
//         weather: weather,
//         dateTime: date,
//         journalmood: journalMood,
//         journalImage: journalImage,
//       );

//       await box.put(keyToUpdate, updatedJournal);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Journal updated successfully!')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Journal not found!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saved Journal Entry'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Title: $journalTitle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 8),
//             Text('Place: $place', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             SizedBox(height: 8),
//             Text('Date: ${date.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             SizedBox(height: 8),
//             Text('Weather: $weather', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             SizedBox(height: 8),
//             Text('Mood: $journalMood', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             SizedBox(height: 16),
//             if (journalImage.isNotEmpty)
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 margin: EdgeInsets.only(bottom: 16),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[300],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.file(
//                     File(journalImage),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             Text('Journal Content:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
//             SizedBox(height: 8),
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(journalContent, style: TextStyle(fontSize: 16)),
//             ),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => JournalViewScreen(
//                           journalToEdit: JournalHiveModel(
//                             journalId: journalId,
//                             journalTitle: journalTitle,
//                             place: place,
//                             journalContent: journalContent,
//                             weather: weather,
//                             dateTime: date,
//                             journalmood: journalMood,
//                             journalImage: journalImage,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('Update'),
//                 ),

//                 // ElevatedButton(
//                 //   onPressed: () => _deleteJournal(context),
//                 //   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                 //   child: Text('Delete'),
//                 // ),

//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red
//                   ),
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DeleteViewScreen(),
//                     ),
//                   ),
//                   // onPressed: () => _deleteJournal(context, journalId), 
//                   child: Text('Delete'))
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
