

// // import 'package:flutter/material.dart';

// // class MoodTrackerViewScreen extends StatefulWidget {
// //   const MoodTrackerViewScreen({super.key});

// //   @override
// //   State<MoodTrackerViewScreen> createState() => _MoodTrackerViewScreenState();
// // }

// // class _MoodTrackerViewScreenState extends State<MoodTrackerViewScreen> {
// //   String? _selectedMood;

// //   final List<Map<String, String>> moodOptions = [
// //     {"emoji": "😄", "label": "Happy"},
// //     {"emoji": "😢", "label": "Sad"},
// //     {"emoji": "😠", "label": "Angry"},
// //     {"emoji": "😌", "label": "Relaxed"},
// //     {"emoji": "😰", "label": "Anxious"},
// //   ];

// //   final List<Map<String, dynamic>> moodHistory = [];

// //   void _selectMood(String mood) {
// //     setState(() {
// //       _selectedMood = mood;
// //       moodHistory.insert(0, {
// //         "mood": mood,
// //         "time": DateTime.now(),
// //       });
// //     });

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(
// //         content: Text("Mood '$mood' recorded!"),
// //         duration: const Duration(seconds: 2),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Mood Tracker"),
// //         backgroundColor: Colors.teal,
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               "How are you feeling today?",
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             // Mood selection row
// //             Wrap(
// //               spacing: 20,
// //               children: moodOptions.map((mood) {
// //                 final isSelected = _selectedMood == mood['label'];
// //                 return GestureDetector(
// //                   onTap: () => _selectMood(mood['label']!),
// //                   child: Column(
// //                     children: [
// //                       CircleAvatar(
// //                         radius: isSelected ? 32 : 28,
// //                         backgroundColor:
// //                             isSelected ? Colors.teal : Colors.grey.shade300,
// //                         child: Text(
// //                           mood['emoji']!,
// //                           style: const TextStyle(fontSize: 24),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),
// //                       Text(mood['label']!),
// //                     ],
// //                   ),
// //                 );
// //               }).toList(),
// //             ),

// //             const SizedBox(height: 30),
// //             const Text(
// //               "Mood History",
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //             const Divider(),

// //             // Mood history list
// //             Expanded(
// //               child: moodHistory.isEmpty
// //                   ? const Center(
// //                       child: Text(
// //                         "No moods tracked yet.",
// //                         style: TextStyle(color: Colors.grey),
// //                       ),
// //                     )
// //                   : ListView.builder(
// //                       itemCount: moodHistory.length,
// //                       itemBuilder: (context, index) {
// //                         final entry = moodHistory[index];
// //                         return ListTile(
// //                           leading: CircleAvatar(
// //                             backgroundColor: Colors.teal.shade100,
// //                             child: Text(
// //                               moodOptions
// //                                       .firstWhere(
// //                                           (m) => m['label'] == entry['mood'])[
// //                                   'emoji'] ??
// //                                   "🙂",
// //                               style: const TextStyle(fontSize: 20),
// //                             ),
// //                           ),
// //                           title: Text(entry['mood']),
// //                           subtitle: Text(
// //                             (entry['time'] as DateTime).toLocal().toString(),
// //                             style: const TextStyle(fontSize: 12),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:mindwave/features/moodtracker/domain/entity/mood_entity.dart';
// import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_evet.dart';
// import 'package:mindwave/features/moodtracker/presentation/view_model/mood_tracker_view_model.dart';

// class MoodTrackerViewScreen extends StatefulWidget {
//   const MoodTrackerViewScreen({super.key});

//   @override
//   State<MoodTrackerViewScreen> createState() => _MoodTrackerViewScreenState();
// }

// class _MoodTrackerViewScreenState extends State<MoodTrackerViewScreen> {
//   final MoodTrackerViewModel _viewModel = MoodTrackerViewModel();

//   // For editing
//   final TextEditingController _emojiController = TextEditingController();
//   final TextEditingController _labelController = TextEditingController();

//   void _showEditDialog(MoodEntity mood) {
//     _emojiController.text = mood.moodEmoji;
//     _labelController.text = mood.moodLabel;

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Edit Mood"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: _emojiController,
//               decoration: const InputDecoration(labelText: "Emoji"),
//               maxLength: 2,
//             ),
//             TextField(
//               controller: _labelController,
//               decoration: const InputDecoration(labelText: "Label"),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _viewModel.updateMood(
//                 mood.moodId!,
//                 _labelController.text.trim(),
//                 _emojiController.text.trim(),
//               );
//               Navigator.of(context).pop();
//               setState(() {}); // refresh UI
//             },
//             child: const Text("Update"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _deleteMood(String moodId) {
//     _viewModel.deleteMood(moodId);
//     setState(() {}); // refresh UI
//   }

//   @override
//   Widget build(BuildContext context) {
//     final moodHistory = _viewModel.moodHistory;
//     final moodOptions = _viewModel.availableMoodOptions;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mood Tracker"),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "How are you feeling today?",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),

//             // Mood selection row
//             Wrap(
//               spacing: 20,
//               children: moodOptions.map((mood) {
//                 final isSelected = _viewModel.selectedMoodLabel == mood['label'];
//                 return GestureDetector(
//                   onTap: () {
//                     _viewModel.onEvent(MoodSelectedEvent(mood['label']!));
//                     setState(() {});
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text("Mood '${mood['label']}' recorded!"),
//                         duration: const Duration(seconds: 2),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: isSelected ? 32 : 28,
//                         backgroundColor: isSelected ? Colors.teal : Colors.grey.shade300,
//                         child: Text(
//                           mood['emoji']!,
//                           style: const TextStyle(fontSize: 24),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(mood['label']!),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),

//             const SizedBox(height: 30),
//             const Text(
//               "Mood History",
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const Divider(),

//             // Mood history list with edit and delete buttons
//             Expanded(
//               child: moodHistory.isEmpty
//                   ? const Center(
//                       child: Text(
//                         "No moods tracked yet.",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: moodHistory.length,
//                       itemBuilder: (context, index) {
//                         final entry = moodHistory[index];
//                         return ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.teal.shade100,
//                             child: Text(
//                               entry.moodEmoji,
//                               style: const TextStyle(fontSize: 20),
//                             ),
//                           ),
//                           title: Text(entry.moodLabel),
//                           subtitle: Text(
//                             entry.moodDateTime.toLocal().toString(),
//                             style: const TextStyle(fontSize: 12),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit, color: Colors.orange),
//                                 onPressed: () {
//                                   _showEditDialog(entry);
//                                 },
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete, color: Colors.red),
//                                 onPressed: () {
//                                   _deleteMood(entry.moodId!);
//                                 },
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
