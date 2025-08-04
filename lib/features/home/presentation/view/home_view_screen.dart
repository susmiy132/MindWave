// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
// // import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';
// // import 'package:mindwave/features/journaling/presentation/view/journal_view.dart';
// // import 'package:mindwave/features/meditation/presentation/view/meditation_view.dart';
// // import 'package:mindwave/features/moodtracker/presentation/view/mood_tracker_view.dart';
// // import 'package:mindwave/features/notice/presentation/view/notice_view.dart';
// // import 'package:mindwave/features/profile/presentation/view/profile_view.dart';
// // import 'package:mindwave/features/progress/presentation/view/progress_view.dart';

// // class HomeViewScreen extends StatefulWidget {
// //   const HomeViewScreen({super.key});

// //   @override
// //   State<HomeViewScreen> createState() => _HomeViewScreenState();
// // }

// // class _HomeViewScreenState extends State<HomeViewScreen> {

// //   int _selectedIndex = 0;

// //   List<Widget> lstBottomScreen = [
// //     // const HomeScreen(),
// //     // const NoticeScreen(),
// //     // const AboutScreen(),
// //     // const ProfileScreen(),
// //     // const ProfileScreen(),

// //     MeditationViewScreen(),
// //     JournalViewScreen(),
// //     MoodTrackerViewScreen(),
// //     DetailedProgressView(),
// //     ProfileViewScreen(),
// //   ];

// //   final bool _isDarkTheme = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Dashboard"),
// //         backgroundColor: Colors.purple.shade900,
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.logout),
// //             onPressed: () {
              
// //               // Logout code
// //               showMySnackBar(
// //                 context: context,
// //                 message: 'Logging out...',
// //                 color: Colors.red,
// //               );

// //               context.read<HomeViewModel>().logout(context);

// //               // Navigator.push(
// //               //   context,
// //               //   MaterialPageRoute(
// //               //     builder: (context) => LoginViewScreen(),
// //               //   )
// //               // );
// //             },
// //           ),
// //           IconButton(
// //             onPressed: () {
// //               // Navigate to NotificationViewScreen
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const NotificationViewScreen(),
// //             ),
// //           );
// //             }, 
// //             icon: const Icon(Icons.notification_add_rounded),
// //           ),
// //           // Switch(
// //           //   value: _isDarkTheme,
// //           //   onChanged: (value) {
// //           //     // Change theme
// //           //     // setState(() {
// //           //     //   _isDarkTheme = value;
// //           //     // });
// //           //   },
// //           // ),
// //         ]
// //       ),

// //       body: lstBottomScreen [_selectedIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //         type: BottomNavigationBarType.fixed,
// //         items: const[
// //           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Meditation"),
// //           BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Journal"),
// //           BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: "Mood"),
// //           BottomNavigationBarItem(icon: Icon(Icons.linear_scale), label: "Progress"),
// //           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
// //         ],

// //         backgroundColor: Colors.purple.shade900,
// //         selectedItemColor: Colors.white,
// //         unselectedItemColor: Colors.black,

// //         currentIndex: _selectedIndex,
// //         onTap: (index) {
// //           setState(() {
// //             _selectedIndex = index;
// //           });
// //         },
// //       ),
      
// //     );
// //   }
// // }


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/features/notice/presentation/view/edit_notice.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
// import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';
// import 'package:mindwave/features/journaling/presentation/view/journal_view.dart';
// import 'package:mindwave/features/meditation/presentation/view/meditation_view.dart';
// import 'package:mindwave/features/moodtracker/presentation/view/mood_tracker_view.dart';
// import 'package:mindwave/features/notice/presentation/view/notice_view.dart';
// import 'package:mindwave/features/profile/presentation/view/profile_view.dart';
// import 'package:mindwave/features/progress/presentation/view/progress_view.dart';

// class HomeViewScreen extends StatefulWidget {
//   const HomeViewScreen({super.key});

//   @override
//   State<HomeViewScreen> createState() => _HomeViewScreenState();
// }

// class _HomeViewScreenState extends State<HomeViewScreen> {
//   int _selectedIndex = 0;
//   late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;
//   bool _hasLoggedOut = false;

//   final List<Widget> _screens = [
//     MeditationViewScreen(),
//     JournalViewScreen(),
//     MoodTrackerViewScreen(),
//     DetailedProgressView(),
//     ProfileViewScreen(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startSensorListeners();
//   }

//   void _startSensorListeners() {
//     const shakeThreshold = 15.0;
//     const rotationThreshold = -9.0;

//     AccelerometerEvent? lastEvent;

//     _accelerometerSubscription = accelerometerEvents.listen((event) {
//       // Shake detection
//       if (lastEvent != null) {
//         final dx = (event.x - lastEvent!.x).abs();
//         final dy = (event.y - lastEvent!.y).abs();
//         final dz = (event.z - lastEvent!.z).abs();

//         if (dx > shakeThreshold || dy > shakeThreshold || dz > shakeThreshold) {
//           _showMeditationReminder();
//         }
//       }

//       // Rotate upside-down to logout
//       if (event.z < rotationThreshold) {
//         _logoutAndGoToLogin();
//       }

//       lastEvent = event;
//     });
//   }

//   void _logoutAndGoToLogin() {
//     if (_hasLoggedOut) return; // prevent multiple triggers
//     _hasLoggedOut = true;

//     _accelerometerSubscription.cancel();

//     showMySnackBar(
//       context: context,
//       message: "Logged out by rotating phone!",
//       color: Colors.red,
//     );

//     // Optional logout logic
//     context.read<HomeViewModel>().logout(context);

//     // Navigate to login
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   void _showMeditationReminder() {
//     showMySnackBar(
//       context: context,
//       message: "🧘 It's your meditation time",
//       color: Colors.purple,
//     );
//   }

//   @override
//   void dispose() {
//     _accelerometerSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dashboard"),
//         backgroundColor: Colors.purple.shade900,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: _logoutAndGoToLogin,
//           ),
//           IconButton(
//             icon: const Icon(Icons.notification_add_rounded),
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text("Running Sensor"),
//                 duration: Duration(seconds: 2),
//                 backgroundColor: Colors.green,
//               ),
//             );

//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => 
//                   NoticeEditPage(
//                   noticeMessage: "It's your meditation time",
//                 ),
//               ),    
//             );

              
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => const NotificationViewScreen(),
//               //   ),
//               // );
//             },
//           ),
//         ],
//       ),
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.black,
//         backgroundColor: Colors.purple.shade900,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: "Meditation"),
//           BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Journal"),
//           BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: "Mood"),
//           BottomNavigationBarItem(icon: Icon(Icons.linear_scale), label: "Progress"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//         ],
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
