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
    });
  }
}
