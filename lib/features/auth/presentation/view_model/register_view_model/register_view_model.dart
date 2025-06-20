// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/core/common/snackbar/my_snackbar.dart';
// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';

// class RegisterViewModel extends Bloc<RegisterEvent, RegisterState>{
//   final UserRegisterUsecase _registerUsecase;
//   final UploadImageUsecase _uploadImageUsecase;

//   RegisterViewModel(
//     this._registerUsecase,
//     this._uploadImageUsecase,
//   ) : super(RegisterState.initial()) {
//     on<RegisterUserEvent>(_onRegisterUser);
//     on<UploadImageEvent>(_onLoadImage);
//   }

//   Future<void> _onRegisterUser(
//     RegisterUserEvent event,
//     Emitter<RegisterState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _registerUsecase(
//       RegisterUsecaseParams(
//         fullName: event.fullName, 
//         email: event.email, 
//         phone: event.phone, 
//         profileImage: state.imageName,
//         password: event.password),
//     );

//     result.fold(
//       (l) {
//         emit(state.copyWith(isLoading: false, isSuccess: false));
//         showMySnackBar(
//           context: event.context,
//           message: l.message,
//           color: Colors.red,
//         );
//       },
//       (r) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//         showMySnackBar(
//           context: event.context,
//           message: "Registration Successful",
//         );
//       },
//     );
//   }

//   void _onLoadImage(UploadImageEvent event, Emitter<RegisterState> emit) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _uploadImageUsecase.call(
//       UploadImageParams(file: event.file),
//     );

//     result.fold(
//       (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
//       (r) {
//         emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
//       },
//     );
//   }
// }