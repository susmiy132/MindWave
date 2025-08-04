// // import 'package:flutter/material.dart';

// // class NotificationViewScreen extends StatelessWidget {
// //   const NotificationViewScreen({super.key});

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
// //               "This is your Notifiction",
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

// class NotificationViewScreen extends StatelessWidget {
//   final String title;
//   final String message;

//   const NotificationViewScreen({
//     Key? key,
//     this.title = "Important Notice",
//     this.message = "This is an important notice for all users. Please read carefully.",
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.announcement,
//                 size: 80,
//                 color: Colors.deepPurple,
//               ),
//               SizedBox(height: 20),
//               Text(
//                 message,
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 40),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Go back or close the notice
//                 },
//                 child: Text("OK"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   textStyle: TextStyle(fontSize: 16),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class NotificationViewScreen extends StatefulWidget {
  const NotificationViewScreen({super.key});

  @override
  State<NotificationViewScreen> createState() => _NotificationViewScreenState();
}

class _NotificationViewScreenState extends State<NotificationViewScreen> {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  bool _hasLoggedOut = false;

  @override
  void initState() {
    super.initState();

    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      final x = event.x;
      final y = event.y;

      // Tilt threshold — adjust as needed
      if (!_hasLoggedOut && (x > 7 || x < -7 || y > 7 || y < -7)) {
        _hasLoggedOut = true;
        _logoutAndGoToLogin();
      }
    });
  }

  void _logoutAndGoToLogin() {
    _accelerometerSubscription?.cancel();

    // Show logout message (optional)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Logged out via sensor tilt")),
    );

    // Navigate to login screen — replace with your actual login route
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.purple.shade900,
      ),
      body: const Center(
        child: Text(
          "Tilt the phone to logout.",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
