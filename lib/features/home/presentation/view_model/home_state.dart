// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/app/service_locator/service_locator.dart';
// import 'package:mindwave/features/home/presentation/view/bottom_navigation/home.dart';
// import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart';

// class HomeState {
//   final int selectedIndex;
//   final List<Widget> views;

//   const HomeState({required this.selectedIndex, required this.views});

//   // Initial state
//   static HomeState initial() {
//     return HomeState(
//       selectedIndex: 0,
//       views: [
//         HomeScreen(),
//         BlocProvider.value(
//           value: serviceLocator<HomeViewModel>(),
//           child: HomeScreen(),
//         ),
        
//       ],
//     );
//   }

//   HomeState copyWith({int? selectedIndex, List<Widget>? views}) {
//     return HomeState(
//       selectedIndex: selectedIndex ?? this.selectedIndex,
//       views: views ?? this.views,
//     );
//   }
// }
