import 'package:flutter/material.dart';

Future<void> showMySnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.deepPurple,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}