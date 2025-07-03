<<<<<<< HEAD
// import 'dart:async';

// import 'package:flutter/material.dart';

// class SplashViewModel {
//   Future<void> initializeApp(BuildContext context, VoidCallback onComplete) async {
//     // Simulate initialization logic (e.g., auth check, remote config, etc.)
//     await Future.delayed(Duration(seconds: 3));
//     onComplete(); // Trigger navigation or next step
//   }
// }



// // lib/view_model/splash_view_model.dart
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mindwave/view/login_screen.dart';

// class SplashViewModel {
//   void navigateToLoginScreen(BuildContext context) {
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LoginScreen()),
//       );
//     });
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/app/service_locator/service_locator.dart';
import 'package:mindwave/features/auth/presentation/view/register_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
class SplashViewModel extends Cubit<void> {
  SplashViewModel() : super(null);

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if(context.mounted){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => BlocProvider.value(
            value: serviceLocator<RegisterViewModel>(),
            child: RegisterView(),
          ))
        );
      }
=======
// lib/view_model/splash_view_model.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mindwave/features/auth/presentation/view/register_view.dart';

class SplashViewModel {
  void navigateToLoginScreen(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterView()),
      );
>>>>>>> sprint3
    });
  }
}
