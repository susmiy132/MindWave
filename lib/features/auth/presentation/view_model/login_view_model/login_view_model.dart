// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/app/service_locator/service_locator.dart';
// import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
// import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
// import 'package:mindwave/features/auth/presentation/view/register_view.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
// import 'package:mindwave/features/home/presentation/view/home_view_screen.dart';
// import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';
// import 'login_event.dart';
// import 'login_state.dart';

// class LoginViewModel extends Bloc<LoginEvent, LoginState> {
//   final UserLoginUsecase _userLoginUsecase;

//   // LoginViewModel(this._userLoginUsecase) : super(LoginState.initial()) {
//   //   on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmailAndPassword);
//   //   on<NavigatetoHomeViewEvent>(_onNavigateToHomeView);
//   // }

//    LoginViewModel(this._userLoginUsecase) : super(LoginState.initial()) {
//     on<NavigateToRegisterViewEvent>(_onNavigateToRegisterView);
//     on<NavigateToHomeViewEvent>(_onNavigateToHomeView);
//     on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmailAndPassword);
//   }

//   void _onNavigateToRegisterView(
//     NavigateToRegisterViewEvent event,
//     Emitter<LoginState> emit,
//   ) {
//     if (event.context.mounted) {
//       Navigator.push(
//         event.context,

//         MaterialPageRoute(
//           builder: (context) => MultiBlocProvider(
//             providers: [
//               // BlocProvider.value(value: serviceLocator<BatchViewModel>()),
//               // BlocProvider.value(value: serviceLocator<CourseViewModel>()),
//               BlocProvider.value(value: serviceLocator<RegisterViewModel>()),
//             ],
//             child: RegisterView(),
//           ),
//         ),
//       );
//     }
//   }

//   void _onNavigateToHomeView(
//     NavigateToHomeViewEvent event,
//     Emitter<LoginState> emit,
//   ) {
//     if (event.context.mounted) {
//       Navigator.pushReplacement(
//         event.context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: serviceLocator<HomeViewModel>(),
//             child: HomeViewScreen(),
//           ),
//         ),
//       );
//     }
//   }
//   void _onLoginWithEmailAndPassword(
//     LoginWithEmailAndPasswordEvent event,
//     Emitter<LoginState> emit,
//   ) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _userLoginUsecase(
//       LoginParams(email: event.email, password: event.password),
//     );

//     result.fold(
//       (failure) {
//         emit(state.copyWith(isLoading: false, isSuccess: false));
//         showMySnackBar(
//           context: event.context,
//           message: 'Invalid credentials. Please try again.',
//           color: Colors.red,
//         );
//       },
//       (token) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//         add(NavigateToHomeViewEvent(context: event.context));
//       },
//     );
//   }

//   // void _onNavigateToHomeView(
//   //   NavigatetoHomeViewEvent event,
//   //   Emitter<LoginState> emit,
//   // ) {
//   //   if (event.context.mounted) {
//   //     Navigator.pushReplacementNamed(event.context,
//   //     MaterialPageRoute(
//   //       builder: (context) => BlocProvider.value(
//   //           value: serviceLocator<HomeViewModel>(),
//   //           child: const HomeView(),
//   //         ),
//   //       ),
//   //     )
//   //   }
//   // }
// }

