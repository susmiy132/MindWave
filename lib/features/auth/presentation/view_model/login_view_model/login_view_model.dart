// // lib/view_model/login_view_model.dart
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class LoginViewModel {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   String? selectedOption;

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   Future<bool> login() async {
//     // Open the box (or create if it doesn't exist)
//     var box = await Hive.openBox('users');

//     // Fetch stored user data from Hive
//     final storedEmail = box.get('email');
//     final storedPassword = box.get('password');

//     // Check if email and password match
//     if (storedEmail == emailController.text &&
//         storedPassword == passwordController.text) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
// import 'package:mindwave/app/service_locator/service_locator.dart';
import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
// import 'package:mindwave/features/home/presentation/view/home_view.dart';
// import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  final UserLoginUsecase _userLoginUsecase;

  LoginViewModel(this._userLoginUsecase) : super(LoginState.initial()) {
    // on<NavigateToRegisterViewEvent>(_onNavigateToRegisterView);
    // on<NavigatetoHomeViewEvent>(_onNavigateToHomeView);
    on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmailAndPassword);
  }

  // void _onNavigateToRegisterView(
  //   NavigatetoRegisterViewEvent event,
  //   Emitter<LoginState> emit,
  // ) {
  //   if (event.context.mounted) {
  //     Navigator.push(
  //       event.context,

  //       MaterialPageRoute(
  //         builder: (context) => MultiBlocProvider(
  //           providers: [
  //             BlocProvider.value(value: serviceLocator<BatchViewModel>()),
  //             BlocProvider.value(value: serviceLocator<CourseViewModel>()),
  //             BlocProvider.value(value: serviceLocator<RegisterViewModel>()),
  //           ],
  //           child: RegisterView(),
  //         ),
  //       ),
  //     );
  //   }
  // }

  // void _onNavigateToHomeView(
  //   NavigatetoHomeViewEvent event,
  //   Emitter<LoginState> emit,
  // ) {
  //   if (event.context.mounted) {
  //     Navigator.pushReplacement(
  //       event.context,
  //       MaterialPageRoute(
  //         builder: (context) => BlocProvider.value(
  //           // value: serviceLocator<HomeViewModel>(),
  //           child: const HomeViewScreen(),
  //         ),
  //       ),
  //     );
  //   }
  // }

  void _onLoginWithEmailAndPassword(
    LoginWithEmailAndPasswordEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _userLoginUsecase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) {
        // Handle failure case
        emit(state.copyWith(isLoading: false, isSuccess: false));

        showMySnackBar(
          context: event.context,
          message: 'Invalid credentials. Please try again.',
          color: Colors.red,
        );
      },
      (token) {
        // Handle success case
        emit(state.copyWith(isLoading: false, isSuccess: true));
        add(NavigatetoHomeViewEvent(context: event.context));
      },
    );
  }
}
