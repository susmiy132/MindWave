
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/app/service_locator/service_locator.dart';
// import 'package:mindwave/features/splash/presentation/view/splash_view_screen.dart';
// import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';
// import 'package:mindwave/app/theme/theme_data.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       theme: getApplicationTheme(),
//       home: BlocProvider.value(
//         value: serviceLocator<SplashViewModel>(),
//         child: SplashViewScreen(),
//       ),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/app/service_locator/service_locator.dart';
import 'package:mindwave/features/splash/presentation/view/splash_view_screen.dart';
import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';
import 'package:mindwave/app/theme/theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashViewModel>(
          create: (_) => serviceLocator<SplashViewModel>(),
        ),
        BlocProvider<HomeViewModel>(
          create: (_) => serviceLocator<HomeViewModel>(),
        ),
        // Add other view models here like ProfileViewModel if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: const SplashViewScreen(),
      ),
    );
  }
}
