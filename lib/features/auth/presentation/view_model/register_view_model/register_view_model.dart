// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
// // import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// // import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';

// // class RegisterViewModel extends Bloc<RegisterEvent, RegisterState>{
// //   final UserRegisterUsecase _registerUsecase;
// //   final UploadImageUsecase _uploadImageUsecase;

// //   RegisterViewModel(
// //     this._registerUsecase,
// //     this._uploadImageUsecase,
// //   ) : super(RegisterState.initial()) {
// //     on<RegisterUserEvent>(_onRegisterUser);
// //     on<UploadImageEvent>(_onLoadImage);
// //   }

// //   Future<void> _onRegisterUser(
// //     RegisterUserEvent event,
// //     Emitter<RegisterState> emit,
// //   ) async {
// //     emit(state.copyWith(isLoading: true));

// //     final result = await _registerUsecase(
// //       RegisterUsecaseParams(
// //         fullName: event.fullName, 
// //         email: event.email, 
// //         phone: event.phone, 
// //         profileImage: state.imageName,
// //         password: event.password),
// //     );

// //     result.fold(
// //       (l) {
// //         emit(state.copyWith(isLoading: false, isSuccess: false));
// //         showMySnackBar(
// //           context: event.context,
// //           message: l.message,
// //           color: Colors.red,
// //         );
// //       },
// //       (r) {
// //         emit(state.copyWith(isLoading: false, isSuccess: true));
// //         showMySnackBar(
// //           context: event.context,
// //           message: "Registration Successful",
// //         );
// //       },
// //     );
// //   }

// //   void _onLoadImage(UploadImageEvent event, Emitter<RegisterState> emit) async {
// //     emit(state.copyWith(isLoading: true));
// //     final result = await _uploadImageUsecase.call(
// //       UploadImageParams(file: event.file),
// //     );

// //     result.fold(
// //       (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
// //       (r) {
// //         emit(state.copyWith(isLoading: false, isSuccess: true, imageName: r));
// //       },
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';

// class RegisterViewModel extends Bloc<RegisterEvent, RegisterState> {
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
//         password: event.password,
//       ),
//     );

//     result.fold(
//       (failure) {
//         emit(state.copyWith(isLoading: false, isSuccess: false));
//         showMySnackBar(
//           context: event.context,
//           message: failure.message,
//           color:Colors.red,
//         );
//       },
//       (success) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//         showMySnackBar(
//           context: event.context,
//           message: "Registration Successful",
//           color: Colors.green,
//         );

//         // Navigate to login page after a short delay
//         Future.delayed(const Duration(seconds: 1), () {
//           Navigator.pushReplacementNamed(event.context, "/login");
//         });
//       },
//     );
//   }

//   void _onLoadImage(UploadImageEvent event, Emitter<RegisterState> emit) async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _uploadImageUsecase.call(
//       UploadImageParams(file: event.file),
//     );

//     result.fold(
//       (failure) => emit(state.copyWith(isLoading: false, isSuccess: false)),
//       (imageName) {
//         emit(state.copyWith(isLoading: false, isSuccess: true, imageName: imageName));
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
import 'package:mindwave/features/auth/presentation/view/login_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';

class RegisterViewModel extends Bloc<RegisterEvent, RegisterState> {
  final UserRegisterUsecase _registerUsecase;
  final UploadImageUsecase _uploadImageUsecase;

  RegisterViewModel(
    this._registerUsecase,
    this._uploadImageUsecase,
  ) : super(RegisterState.initial()) {
    on<RegisterUserEvent>(_onRegisterUser);
    on<UploadImageEvent>(_onLoadImage);
  }

  Future<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _registerUsecase(
      RegisterUsecaseParams(
        fullName: event.fullName,
        email: event.email,
        phone: event.phone,
        profileImage: state.imageName,
        password: event.password,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false, errorMessage: failure.message));
        showMySnackBar(
          context: event.context,
          message: failure.message,
          color: Colors.red,
        );
      },
      (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true, errorMessage: '',));
        showMySnackBar(
          context: event.context,
          message: "Registration Successful",
          color: Colors.green,
        );

        // Navigate after short delay
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            event.context,
            MaterialPageRoute(builder: (_) => LoginViewScreen()),
          );
        });
      },
    );
  }

  Future<void> _onLoadImage(
    UploadImageEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _uploadImageUsecase.call(
      UploadImageParams(file: event.file),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        // ⚠️ If context is needed here, pass it from the event
        if (event.context != null) {
          showMySnackBar(
            context: event.context!,
            message: failure.message,
            color: Colors.red,
          );
        }
      },
      (imageName) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          imageName: imageName,
        ));
      },
    );
  }
}
