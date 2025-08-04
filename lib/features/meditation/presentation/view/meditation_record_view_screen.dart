

// // // // import 'dart:async';
// // // // import 'package:flutter/material.dart';

// // // // class RecordingTimeScreen extends StatefulWidget {
// // // //   final String title;
// // // //   final String duration; // e.g., "10 min"

// // // //   const RecordingTimeScreen({
// // // //     Key? key,
// // // //     required this.title,
// // // //     required this.duration,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   State<RecordingTimeScreen> createState() => _RecordingTimeScreenState();
// // // // }

// // // // class _RecordingTimeScreenState extends State<RecordingTimeScreen> {
// // // //   Timer? _timer;
// // // //   int _remainingSeconds = 0;
// // // //   bool _isRunning = false;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _remainingSeconds = _parseDurationToSeconds(widget.duration);
// // // //   }

// // // //   int _parseDurationToSeconds(String duration) {
// // // //     final parts = duration.split(' ');
// // // //     final value = int.tryParse(parts[0]) ?? 0;
// // // //     return value * 60; // convert minutes to seconds
// // // //   }

// // // //   void _startMeditation() {
// // // //     if (_isRunning) return;

// // // //     setState(() => _isRunning = true);

// // // //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// // // //       if (_remainingSeconds <= 1) {
// // // //         timer.cancel();
// // // //         setState(() {
// // // //           _isRunning = false;
// // // //           _remainingSeconds = 0;
// // // //         });

// // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // //           SnackBar(content: Text('"${widget.title}" meditation completed!')),
// // // //         );
// // // //       } else {
// // // //         setState(() => _remainingSeconds--);
// // // //       }
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _timer?.cancel();
// // // //     super.dispose();
// // // //   }

// // // //   String _formatTime(int totalSeconds) {
// // // //     final minutes = totalSeconds ~/ 60;
// // // //     final seconds = totalSeconds % 60;
// // // //     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Meditation Recording'),
// // // //         backgroundColor: Colors.deepPurple,
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(24),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Text(
// // // //               widget.title,
// // // //               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             Text(
// // // //               'Duration: ${widget.duration}',
// // // //               style: const TextStyle(fontSize: 18),
// // // //             ),
// // // //             const SizedBox(height: 32),
// // // //             Center(
// // // //               child: Text(
// // // //                 _formatTime(_remainingSeconds),
// // // //                 style: const TextStyle(
// // // //                   fontSize: 48,
// // // //                   fontWeight: FontWeight.bold,
// // // //                   color: Colors.deepPurple,
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             const SizedBox(height: 32),
// // // //             Center(
// // // //               child: ElevatedButton.icon(
// // // //                 onPressed: _startMeditation,
// // // //                 icon: const Icon(Icons.play_arrow),
// // // //                 label: const Text('Start Meditation'),
// // // //                 style: ElevatedButton.styleFrom(
// // // //                   backgroundColor: Colors.deepPurple,
// // // //                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }


// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:mindwave/features/meditation/presentation/view_model/meditation_record/meditation_record_event.dart';
// // // import 'package:mindwave/features/meditation/presentation/view_model/meditation_record/meditation_record_state.dart';
// // // import 'package:mindwave/features/meditation/presentation/view_model/meditation_record/meditation_record_view_model.dart';


// // // class RecordingTimeScreen extends StatelessWidget {
// // //   final String title;
// // //   final String duration;

// // //   const RecordingTimeScreen({
// // //     Key? key,
// // //     required this.title,
// // //     required this.duration,
// // //   }) : super(key: key);

// // //   String _formatTime(int totalSeconds) {
// // //     final minutes = totalSeconds ~/ 60;
// // //     final seconds = totalSeconds % 60;
// // //     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocProvider(
// // //       create: (_) => MeditationRecordViewModel(title: title, duration: duration),
// // //       child: Scaffold(
// // //         appBar: AppBar(
// // //           title: const Text('Meditation Recording'),
// // //           backgroundColor: Colors.deepPurple,
// // //         ),
// // //         body: Padding(
// // //           padding: const EdgeInsets.all(24),
// // //           child: BlocConsumer<MeditationRecordViewModel, MeditationRecordState>(
// // //             listener: (context, state) {
// // //               if (!state.isRunning && state.remainingSeconds == 0) {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   SnackBar(content: Text('"${state.title}" meditation completed!')),
// // //                 );
// // //               }
// // //             },
// // //             builder: (context, state) {
// // //               return Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text(
// // //                     state.title,
// // //                     style: const TextStyle(
// // //                       fontSize: 28,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 16),
// // //                   Text(
// // //                     'Duration: ${state.duration}',
// // //                     style: const TextStyle(fontSize: 18),
// // //                   ),
// // //                   const SizedBox(height: 32),
// // //                   Center(
// // //                     child: Text(
// // //                       _formatTime(state.remainingSeconds),
// // //                       style: const TextStyle(
// // //                         fontSize: 48,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Colors.deepPurple,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 32),
// // //                   Center(
// // //                     child: ElevatedButton.icon(
// // //                       onPressed: state.isRunning
// // //                           ? null
// // //                           : () => context.read<MeditationRecordViewModel>().add(StartMeditation()),
// // //                       icon: const Icon(Icons.play_arrow),
// // //                       label: const Text('Start Meditation'),
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: Colors.deepPurple,
// // //                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               );
// // //             },
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'dart:async';
// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class MeditationSession {
// //   final String title;
// //   final String duration;
// //   final DateTime completedAt;

// //   MeditationSession({
// //     required this.title,
// //     required this.duration,
// //     required this.completedAt,
// //   });

// //   Map<String, dynamic> toJson() => {
// //         'title': title,
// //         'duration': duration,
// //         'completedAt': completedAt.toIso8601String(),
// //       };

// //   factory MeditationSession.fromJson(Map<String, dynamic> json) {
// //     return MeditationSession(
// //       title: json['title'],
// //       duration: json['duration'],
// //       completedAt: DateTime.parse(json['completedAt']),
// //     );
// //   }
// // }

// // class RecordingTimeScreen extends StatefulWidget {
// //   final String title;
// //   final String duration; // e.g., "10 min"

// //   const RecordingTimeScreen({
// //     Key? key,
// //     required this.title,
// //     required this.duration,
// //   }) : super(key: key);

// //   @override
// //   State<RecordingTimeScreen> createState() => _RecordingTimeScreenState();
// // }

// // class _RecordingTimeScreenState extends State<RecordingTimeScreen> {
// //   Timer? _timer;
// //   int _remainingSeconds = 0;
// //   bool _isRunning = false;
// //   List<MeditationSession> _completedSessions = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _remainingSeconds = _parseDurationToSeconds(widget.duration);
// //     _loadMeditationHistory();
// //   }

// //   int _parseDurationToSeconds(String duration) {
// //     final parts = duration.split(' ');
// //     final value = int.tryParse(parts[0]) ?? 0;
// //     return value * 60; // convert minutes to seconds
// //   }

// //   void _startMeditation() {
// //     if (_isRunning) return;

// //     setState(() => _isRunning = true);

// //     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       if (_remainingSeconds <= 1) {
// //         timer.cancel();
// //         setState(() {
// //           _isRunning = false;
// //           _remainingSeconds = 0;
// //         });

// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('"${widget.title}" meditation completed!')),
// //         );

// //         _saveMeditationHistory();
// //       } else {
// //         setState(() => _remainingSeconds--);
// //       }
// //     });
// //   }

// //   Future<void> _saveMeditationHistory() async {
// //     final session = MeditationSession(
// //       title: widget.title,
// //       duration: widget.duration,
// //       completedAt: DateTime.now(),
// //     );

// //     final prefs = await SharedPreferences.getInstance();
// //     final List<String> history =
// //         prefs.getStringList('meditation_history') ?? [];

// //     history.add(jsonEncode(session.toJson()));
// //     await prefs.setStringList('meditation_history', history);

// //     _loadMeditationHistory(); // Refresh the list
// //   }

// //   Future<void> _loadMeditationHistory() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final List<String> historyJson =
// //         prefs.getStringList('meditation_history') ?? [];

// //     setState(() {
// //       _completedSessions = historyJson
// //           .map((jsonStr) =>
// //               MeditationSession.fromJson(jsonDecode(jsonStr)))
// //           .toList()
// //           .reversed
// //           .toList();
// //     });
// //   }

// //   String _formatTime(int totalSeconds) {
// //     final minutes = totalSeconds ~/ 60;
// //     final seconds = totalSeconds % 60;
// //     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
// //   }

// //   @override
// //   void dispose() {
// //     _timer?.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Meditation Recording'),
// //         backgroundColor: Colors.deepPurple,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               widget.title,
// //               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 16),
// //             Text(
// //               'Duration: ${widget.duration}',
// //               style: const TextStyle(fontSize: 18),
// //             ),
// //             const SizedBox(height: 32),
// //             Center(
// //               child: Text(
// //                 _formatTime(_remainingSeconds),
// //                 style: const TextStyle(
// //                   fontSize: 48,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.deepPurple,
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 32),
// //             Center(
// //               child: ElevatedButton.icon(
// //                 onPressed: _startMeditation,
// //                 icon: const Icon(Icons.play_arrow),
// //                 label: const Text('Start Meditation'),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.deepPurple,
// //                   padding:
// //                       const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 40),
// //             const Divider(),
// //             const SizedBox(height: 12),
// //             const Text(
// //               "Meditation History",
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 12),
// //             _completedSessions.isEmpty
// //                 ? const Text("No completed meditations yet.")
// //                 : ListView.builder(
// //                     shrinkWrap: true,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     itemCount: _completedSessions.length,
// //                     itemBuilder: (context, index) {
// //                       final session = _completedSessions[index];
// //                       return ListTile(
// //                         contentPadding: EdgeInsets.zero,
// //                         title: Text(session.title),
// //                         subtitle: Text('Duration: ${session.duration}'),
// //                         trailing: Text(
// //                           '${session.completedAt.toLocal()}'.split('.')[0],
// //                           style: const TextStyle(fontSize: 12),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MeditationSession {
//   final String title;
//   final String duration;
//   final DateTime completedAt;

//   MeditationSession({
//     required this.title,
//     required this.duration,
//     required this.completedAt,
//   });

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'duration': duration,
//         'completedAt': completedAt.toIso8601String(),
//       };

//   factory MeditationSession.fromJson(Map<String, dynamic> json) {
//     return MeditationSession(
//       title: json['title'],
//       duration: json['duration'],
//       completedAt: DateTime.parse(json['completedAt']),
//     );
//   }
// }

// class RecordingTimeScreen extends StatefulWidget {
//   final String title;
//   final String duration; // e.g., "10 min"

//   const RecordingTimeScreen({
//     Key? key,
//     required this.title,
//     required this.duration,
//   }) : super(key: key);

//   @override
//   State<RecordingTimeScreen> createState() => _RecordingTimeScreenState();
// }

// class _RecordingTimeScreenState extends State<RecordingTimeScreen> {
//   Timer? _timer;
//   int _remainingSeconds = 0;
//   bool _isRunning = false;
//   List<MeditationSession> _completedSessions = [];

//   @override
//   void initState() {
//     super.initState();
//     _remainingSeconds = _parseDurationToSeconds(widget.duration);
//     _loadMeditationHistory();
//   }

//   int _parseDurationToSeconds(String duration) {
//     final parts = duration.split(' ');
//     final value = int.tryParse(parts[0]) ?? 0;
//     return value * 60; // convert minutes to seconds
//   }

//   void _startMeditation() {
//     if (_isRunning) return;

//     setState(() => _isRunning = true);

//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingSeconds <= 1) {
//         timer.cancel();
//         setState(() {
//           _isRunning = false;
//           _remainingSeconds = 0;
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('"${widget.title}" meditation completed!')),
//         );

//         _saveMeditationHistory();
//       } else {
//         setState(() => _remainingSeconds--);
//       }
//     });
//   }

//   Future<void> _saveMeditationHistory() async {
//     final session = MeditationSession(
//       title: widget.title,
//       duration: widget.duration,
//       completedAt: DateTime.now(),
//     );

//     final prefs = await SharedPreferences.getInstance();
//     final List<String> history =
//         prefs.getStringList('meditation_history') ?? [];

//     history.add(jsonEncode(session.toJson()));
//     await prefs.setStringList('meditation_history', history);

//     _loadMeditationHistory(); // Refresh the list
//   }

//   Future<void> _loadMeditationHistory() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<String> historyJson =
//         prefs.getStringList('meditation_history') ?? [];

//     setState(() {
//       _completedSessions = historyJson
//           .map((jsonStr) =>
//               MeditationSession.fromJson(jsonDecode(jsonStr)))
//           .toList()
//           .reversed
//           .toList();
//     });
//   }

//   Future<void> _deleteMeditationSession(int index) async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<String> historyJson =
//         prefs.getStringList('meditation_history') ?? [];

//     if (index < historyJson.length) {
//       historyJson.removeAt(historyJson.length - 1 - index);
//       await prefs.setStringList('meditation_history', historyJson);
//     }

//     setState(() {
//       _completedSessions.removeAt(index);
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Meditation session deleted')),
//     );
//   }

//   String _formatTime(int totalSeconds) {
//     final minutes = totalSeconds ~/ 60;
//     final seconds = totalSeconds % 60;
//     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Meditation Recording'),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.title,
//               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Duration: ${widget.duration}',
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 32),
//             Center(
//               child: Text(
//                 _formatTime(_remainingSeconds),
//                 style: const TextStyle(
//                   fontSize: 48,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 32),
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: _startMeditation,
//                 icon: const Icon(Icons.play_arrow),
//                 label: const Text('Start Meditation'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             const Divider(),
//             const SizedBox(height: 12),
//             const Text(
//               "Meditation History",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             _completedSessions.isEmpty
//                 ? const Text("No completed meditations yet.")
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: _completedSessions.length,
//                     itemBuilder: (context, index) {
//                       final session = _completedSessions[index];
//                       return ListTile(
//                         contentPadding: EdgeInsets.zero,
//                         title: Text(session.title),
//                         subtitle: Text('Duration: ${session.duration}'),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.grey),
//                               onPressed: () {
//                                 // Optional: Implement edit functionality later
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('Edit not implemented yet'),
//                                   ),
//                                 );
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => _deleteMeditationSession(index),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
