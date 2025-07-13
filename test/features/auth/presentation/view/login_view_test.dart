import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/auth/presentation/view/login_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:mocktail/mocktail.dart';


class MockLoginViewModel extends MockBloc<LoginEvent, LoginState> implements LoginViewModel{}
void main() {
  late MockLoginViewModel loginViewModel;

  setUp(() {
    loginViewModel = MockLoginViewModel();
  });

  Widget loadLoginViewModel() {
    return BlocProvider<LoginViewModel>(
      create: (context) => loginViewModel,
      child: MaterialApp(home: LoginViewScreen()),
    );
  }
  testWidgets('login view model ...', (tester) async {

    when(() => loginViewModel.state).thenReturn(LoginState.initial());

    await tester.pumpWidget(loadLoginViewModel());
    await tester.pumpAndSettle();

    // final button by text
    final result = find.widgetWithText(ElevatedButton, 'Login');
    expect(result, findsOneWidget);
  });
}