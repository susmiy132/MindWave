// // import 'package:flutter/material.dart';

// // class ProgressViewScreen extends StatelessWidget {
// //   const ProgressViewScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: SizedBox(
// //           height: 140,
// //           width: double.infinity,
// //           child: Card(
// //             color: Colors.deepPurple,
// //             child: Text(
// //               "This is your Progress Bar",
// //               style: TextStyle(
// //                 color: Colors.white, 
// //               ),

// //             ),
// //           ),
// //         )
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class DetailedProgressView extends StatelessWidget {
//   const DetailedProgressView({super.key});

//   final List<Map<String, dynamic>> dailyProgress = const [
//     {
//       'date': '2025-07-20',
//       'meditationMinutes': 15,
//       'mood': 'Happy',
//       'moodIcon': Icons.sentiment_satisfied_alt,
//       'journaled': true,
//     },
//     {
//       'date': '2025-07-19',
//       'meditationMinutes': 5,
//       'mood': 'Anxious',
//       'moodIcon': Icons.sentiment_dissatisfied,
//       'journaled': false,
//     },
//     {
//       'date': '2025-07-18',
//       'meditationMinutes': 10,
//       'mood': 'Calm',
//       'moodIcon': Icons.sentiment_neutral,
//       'journaled': true,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Daily Progress"),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: dailyProgress.length,
//         padding: const EdgeInsets.all(12),
//         itemBuilder: (context, index) {
//           final day = dailyProgress[index];
//           final progress = day['meditationMinutes'] / 20.0;

//           return Card(
//             elevation: 4,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     day['date'],
//                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   const SizedBox(height: 12),

//                   // Meditation Progress
//                   Row(
//                     children: [
//                       const Icon(Icons.self_improvement, color: Colors.green),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: LinearProgressIndicator(
//                           value: progress > 1.0 ? 1.0 : progress,
//                           minHeight: 10,
//                           backgroundColor: Colors.grey.shade300,
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text("${day['meditationMinutes']} min"),
//                     ],
//                   ),
//                   const SizedBox(height: 10),

//                   // Mood
//                   Row(
//                     children: [
//                       const Icon(Icons.mood, color: Colors.amber),
//                       const SizedBox(width: 8),
//                       Icon(day['moodIcon'], color: Colors.orange),
//                       const SizedBox(width: 6),
//                       Text(day['mood'], style: const TextStyle(fontSize: 15)),
//                     ],
//                   ),
//                   const SizedBox(height: 10),

//                   // Journaling status
//                   Row(
//                     children: [
//                       const Icon(Icons.edit_note, color: Colors.blue),
//                       const SizedBox(width: 8),
//                       Text(
//                         day['journaled'] ? 'Journaled ✅' : 'No Journal ❌',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: day['journaled'] ? Colors.green : Colors.red,
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
