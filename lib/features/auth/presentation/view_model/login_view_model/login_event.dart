import 'package:flutter/material.dart';

@immutable
sealed class LoginEvent {}

class NavigatetoHomeViewEvent extends LoginEvent{
  final BuildContext context;

  NavigatetoHomeViewEvent({required this.context});
}

class LoginWithEmailAndPasswordEvent extends LoginEvent{
  final BuildContext context;
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({
    required this.context,
    required this.email,
    required this.password
  });
}