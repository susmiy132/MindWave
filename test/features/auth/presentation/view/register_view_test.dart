// // Widget Testing

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mindwave/features/auth/presentation/view/login_view.dart';
// import 'package:mindwave/features/auth/presentation/view/register_view.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
// import 'package:mocktail/mocktail.dart';

// class MockRegisterViewModel extends MockBloc<RegisterEvent, RegisterState> implements RegisterViewModel{}
// void main() {
//   late MockRegisterViewModel registerViewModel;

//   setUp(() {
//     registerViewModel = MockRegisterViewModel();
//   });

//   Widget loadRegisterViewModel() {
//     return BlocProvider<RegisterViewModel>(
//       create: (context) => registerViewModel,
//       child: MaterialApp(home: RegisterView()),
//     );
//   }
//   testWidgets('register view model ...', (tester) async {

//     when(() => registerViewModel.state).thenReturn(RegisterState.initial());

//     await tester.pumpWidget(loadRegisterViewModel());
//     await tester.pumpAndSettle();

//     // final button by text
//     final result = find.widgetWithText(ElevatedButton, 'Register');
//     expect(result, findsOneWidget);
//   });
// }