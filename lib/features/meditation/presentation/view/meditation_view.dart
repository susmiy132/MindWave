

// // import 'package:flutter/material.dart';
// // import 'package:mindwave/features/meditation/presentation/view/meditation_card.dart';

// // class MeditationViewScreen extends StatelessWidget {
// //   const MeditationViewScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Meditation"),
// //         backgroundColor: Colors.deepPurple,
// //         centerTitle: true,
// //       ),
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         color: Colors.deepPurple.shade50,
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               "Welcome to your Meditation Space",
// //               style: TextStyle(
// //                 fontSize: 22,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.deepPurple,
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             Expanded(
// //               child: ListView(
// //                 children: const [
// //                   MeditationCard(
// //                     title: "Morning Calm",
// //                     description: "Start your day with peaceful focus.",
// //                     duration: "10 min",
// //                   ),
// //                   MeditationCard(
// //                     title: "Evening Relaxation",
// //                     description: "Wind down and relax before bed.",
// //                     duration: "15 min",
// //                   ),
// //                   MeditationCard(
// //                     title: "Stress Relief",
// //                     description: "Let go of anxiety and tension.",
// //                     duration: "12 min",
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:mindwave/features/meditation/presentation/view/meditation_card.dart';

// class MeditationViewScreen extends StatelessWidget {
//   const MeditationViewScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Meditation"),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.deepPurple.shade50,
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Welcome to your Meditation Space",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: ListView(
//                 children: const [
//                   MeditationCard(
//                     title: "Breathing meditation",
//                     description: "By inhaling for 4 seconds, holding the breadth for 7 seconds, and exhaling for 8 seconds, this method helps regulate the nervous system and can lead to improved mental and physical well-being.", 
//                     // "It's an accessible practice suitable for anyone seeking a quick way to alleviate stress and enhance calmness.",
//                     duration: "1 min",
//                   ),
//                   MeditationCard(
//                     title: "Morning Calm",
//                     description: "Start your day with peaceful focus.",
//                     duration: "10 min",
//                   ),
//                   MeditationCard(
//                     title: "Evening Relaxation",
//                     description: "Wind down and relax before bed.",
//                     duration: "15 min",
//                   ),
//                   MeditationCard(
//                     title: "Stress Relief",
//                     description: "Let go of anxiety and tension.",
//                     duration: "12 min",
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
