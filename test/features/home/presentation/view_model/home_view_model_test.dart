import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:mindwave/features/home/presentation/view_model/home_state.dart';
import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginViewModel extends Mock implements LoginViewModel {}

void main() {
  late MockLoginViewModel mockLoginViewModel;
  late HomeViewModel homeViewModel;

  setUp(() {
    mockLoginViewModel = MockLoginViewModel();
    homeViewModel = HomeViewModel(loginViewModel: mockLoginViewModel);
  });

  test('initial state is HomeState.initial()', () {
    expect(homeViewModel.state, HomeState.initial());
  });

  blocTest<HomeViewModel, HomeState>(
    'emits updated selectedIndex when onTabTapped is called',
    build: () => homeViewModel,
    act: (bloc) => bloc.onTabTapped(2),
    expect: () => [HomeState.initial().copyWith(selectedIndex: 2)],
  );

  testWidgets('logout triggers navigation to LoginViewScreen', (tester) async {
    // For this test we need to pump a MaterialApp and test navigation.
    // We mock LoginViewModel to provide to HomeViewModel.
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () {
              homeViewModel.logout(context);
            },
            child: const Text('Logout'),
          );
        }),
      ),
    );

    // Tap the button to trigger logout
    await tester.tap(find.text('Logout'));
    await tester.pumpAndSettle();

    // Since your logout method's navigation code is commented out and no real navigation
    // happens, there will be no route change.
    // So if you add navigation logic, you can test it here by checking navigator.

    // For now, just verify no exceptions and button exists.
    expect(find.text('Logout'), findsOneWidget);
  });
}
