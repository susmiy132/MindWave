
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? userId;
  final String fullName;
  final String email;
  final String phone;
  final String? profileImage;
  final String password;

<<<<<<< HEAD
  const UserEntity({
    this.userId, 
    required this.fullName,
    required this.email, 
    required this.phone, 
    required this.profileImage, 
    required this.password});
=======
  const UserEntity({this.userId, required this.fullName, required this.email, required this.phone, required this.profileImage, required this.password});
>>>>>>> sprint3


  @override
  List<Object?> get props => [userId, fullName, email, phone, profileImage, password];
}