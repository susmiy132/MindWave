// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mindwave/core/network/hive_service.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_event.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_state.dart';
// // import 'package:mindwave/features/profile/presentation/view_model/profile_event.dart';
// // import 'package:mindwave/features/profile/presentation/view_model/profile_state.dart' hide ProfileState, ProfileLoading, ProfileError, ProfileInitial, ProfileLoaded;
// // import 'package:mindwave/features/auth/domain/entity/user_entity.dart';// replace with your actual service

// // class ProfileViewModel extends Bloc<ProfileEvent, ProfileState> {
// //   final HiveService _userHiveService = HiveService(); // Inject if using DI

// //   ProfileViewModel() : super(ProfileInitial()) {
// //     on<LoadUserDataEvent>(_onLoadUserData);
// //     on<LogoutUserEvent>(_onLogoutUser);
// //   }
  
// //   get hiveService => null;

// //   Future<void> _onLoadUserData(
// //     LoadUserDataEvent event,
// //     Emitter<ProfileState> emit,
// //   ) async {
// //     emit(ProfileLoading());
// //     try {
// //       // final user = await _userHiveService.getUser(); // Load from Hive
// //       final userId = 'your_user_id_here'; // Replace with actual logic
// //       final user = await hiveService.getUser(userId); // ✅ Correct

// //       if (user != null) {
// //         emit(ProfileLoaded(user.toEntity()));
// //       } else {
// //         emit(ProfileError("No user found."));
// //       }
// //     } catch (e) {
// //       emit(ProfileError("Failed to load user data: $e"));
// //     }
// //   }

// //   Future<void> _onLogoutUser(
// //     LogoutUserEvent event,
// //     Emitter<ProfileState> emit,
// //   ) async {
// //     emit(ProfileLoading());
// //     try {
// //       await _userHiveService.clearUser(); // Clear user from Hive
// //       emit(ProfileLogoutSuccess());
// //     } catch (e) {
// //       emit(ProfileError("Logout failed: $e"));
// //     }
// //   }
// // }


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mindwave/core/network/hive_service.dart';
// import 'package:mindwave/features/auth/domain/entity/user_entity.dart';
// import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_event.dart';
// import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_state.dart';


// class ProfileViewModel extends Bloc<ProfileEvent, ProfileState> {
//   final HiveService _hiveService = HiveService();

//   ProfileViewModel() : super(ProfileInitial()) {
//     on<LoadUserDataEvent>(_onLoadUserData);
//     on<LogoutUserEvent>(_onLogout);
//   }

//   void _onLoadUserData(LoadUserDataEvent event, Emitter<ProfileState> emit) async {
//     emit(ProfileLoading());
//     try {
//       final users = await _hiveService.getAllAuth();
//       if (users.isNotEmpty) {
//         final userEntity = users.first.toEntity();
//         emit(ProfileLoaded(userEntity));
//       } else {
//         emit(ProfileError("No user data found."));
//       }
//     } catch (e) {
//       emit(ProfileError("Failed to load user data"));
//     }
//   }

//   void _onLogout(LogoutUserEvent event, Emitter<ProfileState> emit) async {
//     try {
//       await _hiveService.clearAll();
//       emit(ProfileLogoutSuccess());
//     } catch (_) {
//       emit(ProfileError("Logout failed"));
//     }
//   }
// }
