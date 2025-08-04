import 'dart:io';
import 'package:flutter/material.dart';

@immutable
sealed class RegisterEvent {}

class UploadImageEvent extends RegisterEvent {
  final File file;
  final BuildContext context;

  UploadImageEvent({
    required this.file,
    required this.context,
  });
}

class RegisterUserEvent extends RegisterEvent {
  final BuildContext context;
  final String fullName;
  final String email;
  final String phone;
  final String? image;
  final String password;

  RegisterUserEvent({
    required this.context,
    required this.fullName,
    required this.email,
    required this.phone,
    this.image,
    required this.password,
  });
}
