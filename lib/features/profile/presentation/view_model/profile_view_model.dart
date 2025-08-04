// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mindwave/features/auth/presentation/view_model/profile_view_model/profile_event.dart';
// // import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'profile_state.dart';
// // import '../../../auth/domain/entity/user_entity.dart';

// // class ProfileViewModel extends Cubit<ProfileState> {
// //   ProfileViewModel() : super(ProfileInitial());

// //   get profile => null;

// //   Future<void> loadUserData() async {
// //     emit(ProfileLoading());
// //     try {
// //       final prefs = await SharedPreferences.getInstance();

// //       final fullName = prefs.getString("fullName");
// //       final email = prefs.getString("email");
// //       final phone = prefs.getString("phone");
// //       final profileImage = prefs.getString("profileImage");
// //       final password = prefs.getString("password");
// //       final userId = prefs.getString("userId");

// //       if (fullName != null && email != null && phone != null && password != null) {
// //         emit(ProfileLoaded(UserEntity(
// //           userId: userId,
// //           fullName: fullName,
// //           email: email,
// //           phone: phone,
// //           profileImage: profileImage,
// //           password: password,
// //         )));
// //       } else {
// //         emit(ProfileError("Incomplete user data"));
// //       }
// //     } catch (e) {
// //       emit(ProfileError("Failed to load user data: $e"));
// //     }
// //   }

// //   void add(LogoutUserEvent logoutUserEvent) {}

// //   void saveProfile(ProfileEntity updatedProfile) {}

// //   void deleteProfile(userId) {}
// // }

// // class LogoutUserEvent {
// // }


// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mindwave/features/profile/domain/entity/profile_entity.dart';
// import 'package:mindwave/features/profile/domain/use_case/delete_profile_usecase.dart';
// import 'package:mindwave/features/profile/domain/use_case/get_profile_usecase.dart';
// import 'package:mindwave/features/profile/domain/use_case/save_profile_usecase.dart';

// class ProfileViewModel extends ChangeNotifier {
//   ProfileEntity? _profile;
//   bool _isLoading = false;

//   final GetProfileUseCase _getProfileUseCase;
//   final SaveProfileUseCase _saveProfileUseCase;
//   final DeleteProfileUseCase _deleteProfileUseCase;
  

//   ProfileViewModel({
//     required GetProfileUseCase getProfileUseCase,
//     required SaveProfileUseCase saveProfileUseCase,
//     required DeleteProfileUseCase deleteProfileUseCase,
//   })  : _getProfileUseCase = getProfileUseCase,
//         _saveProfileUseCase = saveProfileUseCase,
//         _deleteProfileUseCase = deleteProfileUseCase;

//   ProfileEntity? get profile => _profile;
//   bool get isLoading => _isLoading;
  
//   String get userId {
//   final id = Hive.box('authBox').get('userId') as String?;
//   if (id != null) {
//     return id;
//   } else {
//     throw Exception('User ID not found in Hive box');
//   }
// }

//   Future<void> loadProfile() async {
//     _isLoading = true;
//     notifyListeners();

//     final result = await _getProfileUseCase(userId);
//     _profile = result;

//     _isLoading = false;
//     notifyListeners();
//   }

//   Future<void> saveProfile(ProfileEntity profile) async {
//     _isLoading = true;
//     notifyListeners();

//     await _saveProfileUseCase(profile);
//     _profile = profile;

//     _isLoading = false;
//     notifyListeners();
//   }

//   Future<void> deleteProfile() async {
//     _isLoading = true;
//     notifyListeners();

//     await _deleteProfileUseCase(userId);
//     _profile = null;

//     _isLoading = false;
//     notifyListeners();
//   }
// }
