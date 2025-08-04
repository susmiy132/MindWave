// import 'package:flutter/material.dart';

// @immutable
// sealed class LoginEvent {}

// class NavigatetoHomeViewEvent extends LoginEvent{
//   final BuildContext context;

//   NavigatetoHomeViewEvent({required this.context});
// }

// class LoginWithEmailAndPasswordEvent extends LoginEvent{
//   final BuildContext context;
//   final String email;
//   final String password;

//   LoginWithEmailAndPasswordEvent({
//     required this.context,
//     required this.email,
//     required this.password
//   });
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPasswordEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [email, password, context];
}

class NavigateToRegisterViewEvent extends LoginEvent {
  final BuildContext context;

  NavigateToRegisterViewEvent({required this.context});
}

class NavigateToHomeViewEvent extends LoginEvent {
  final BuildContext context;

  NavigateToHomeViewEvent({required this.context});
}

class NavigatetoHomeViewEvent extends LoginEvent {
  final BuildContext context;

  const NavigatetoHomeViewEvent({required this.context});

  @override
  List<Object?> get props => [context];
}
