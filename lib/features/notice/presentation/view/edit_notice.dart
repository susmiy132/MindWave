// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // for formatting time

// class NoticeEditPage extends StatelessWidget {
//   final String noticeMessage;

//   const NoticeEditPage({super.key, required this.noticeMessage});

//   @override
//   Widget build(BuildContext context) {
//     final currentTime = DateFormat('hh:mm a').format(DateTime.now());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Notice'),
//         backgroundColor: Colors.purple.shade900,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.purple.shade50,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Your Notice',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.purple,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 noticeMessage,
//                 style: const TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 currentTime,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
