import 'package:equatable/equatable.dart';

class RegisterState extends Equatable{
  final bool isLoading;
  final bool isSuccess;
  final String? imageName;
  final String errorMessage;

  const RegisterState({
    required this.isLoading,
    required this.isSuccess,
    this.imageName,
    required this.errorMessage,
  });

  const RegisterState.initial()
    : isLoading = false,
      isSuccess = false,
      imageName = ' ',
      errorMessage = "null";

  RegisterState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? imageName,
    String? errorMessage,

  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      imageName: imageName ?? this.imageName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  
  @override
  List<Object?> get props => [isLoading, isSuccess, imageName, errorMessage];

}
