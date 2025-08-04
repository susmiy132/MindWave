import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/app/service_locator/service_locator.dart';
import 'package:mindwave/features/auth/presentation/view/login_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:mindwave/features/home/presentation/view_model/home_state.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel({required this.loginViewModel}) : super(HomeState.initial());

  final LoginViewModel loginViewModel;

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void logout(BuildContext context) {
    // Wait for 2 seconds
    // Future.delayed(const Duration(seconds: 2), () async {
    //   if (context.mounted) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) =>
    //             BlocProvider.value(value: loginViewModel, child: LoginViewScreen()),
    //       ),
    //     );
    //   }
    // });

    Future<void> _initHomeModule() async {
      serviceLocator.registerFactory(
        () => HomeViewModel(
        loginViewModel: serviceLocator<LoginViewModel>(),
      ),
    );
}
  }
}
