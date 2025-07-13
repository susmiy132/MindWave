// import 'package:get_it/get_it.dart';
<<<<<<< HEAD
// import 'package:mindwave/core/network/api_service.dart';
// import 'package:mindwave/core/network/hive_service.dart';
// import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
// import 'package:mindwave/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
// import 'package:mindwave/features/auth/data/repository/local_repository/user_local_repository.dart';
// import 'package:mindwave/features/auth/data/repository/remote_repository/user_remote_repository.dart';
// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
// import 'package:mindwave/features/auth/domain/use_case/get_current_user_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
=======
// import 'package:mindwave/core/network/hive_service.dart';
// import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
// import 'package:mindwave/features/auth/data/repository/local_repository/user_local_repository.dart';
>>>>>>> sprint3
// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
// import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';

// final serviceLocator = GetIt.instance;
// Future initDependencies() async {
//   await _initHiveService();
//   await _initAuthModule();
//   await _initSplashModule();
// }

// Future _initHiveService() async{
//   serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
// }

<<<<<<< HEAD
// // Future _initAuthModule() async{
// //   serviceLocator.registerFactory(
// //     () => UserLocalDatasource(HiveService: serviceLocator<HiveService>()),
// //   );

// //   serviceLocator.registerFactory(
// //     () => UserLocalRepository(localDatasource: serviceLocator<UserLocalDatasource>()),
// //   );



// //   serviceLocator.registerFactory(
// //     () => RegisterViewModel(
// //       serviceLocator<UserRegisterUsecase>(),
// //       serviceLocator<UploadImageUsecase>()
// //     ),
// //   );
=======
// Future _initAuthModule() async{
//   serviceLocator.registerFactory(
//     () => UserLocalDatasource(HiveService: serviceLocator<HiveService>()),
//   );

//   serviceLocator.registerFactory(
//     () => UserLocalRepository(localDatasource: serviceLocator<UserLocalDatasource>()),
//   );

//   serviceLocator.registerFactory(
//     () => RegisterViewModel(
//       serviceLocator<UserRegisterUsecase>(),
//       serviceLocator<UploadImageUsecase>()
//     ),
//   );
>>>>>>> sprint3

//   // serviceLocator.registerFactory(
//   //   () => LoginViewModel(serviceLocator<UserLoginUsecase>()),
//   // );

//   // Future<void> _initSplashModule()async {
//   //   serviceLocator.registerFactory(() => SplashViewModel());
//   // }
<<<<<<< HEAD
// // }


// Future _initAuthModule() async {
//   // Data Source
//   serviceLocator.registerFactory(
//     () => UserLocalDatasource(HiveService: serviceLocator<HiveService>()),
//   );

//   serviceLocator.registerFactory(
//     () => UserRemoteDatasource(apiService: serviceLocator<ApiService>())
//   );


//   // Repository
//   serviceLocator.registerFactory(
//     () => UserLocalRepository(localDatasource: serviceLocator<UserLocalDatasource>())
//   );

//   serviceLocator.registerFactory(
//     () => UserRemoteRepository(userRemoteDatasource: serviceLocator<UserRemoteDatasource>())
//   );

//   // usecase
//   serviceLocator.registerFactory(
//     () => UserLoginUsecase(userrepository: serviceLocator<UserRemoteRepository>())
//   );

//   serviceLocator.registerFactory(
//     () => UserRegisterUsecase(userrepository: serviceLocator<UserRemoteRepository>())
//   );

//   serviceLocator.registerFactory(
//     () => UploadImageUsecase(userRepository: serviceLocator<UserRemoteRepository>())
//   );
//   serviceLocator.registerFactory(
//     () => GetCurrentUserUsecase(userRepository: serviceLocator<UserRemoteRepository>())
//   );

//   // 🧠 Register interface instead of concrete class
//   serviceLocator.registerFactory<IUserRepository>(
//     () => UserLocalRepository(localDatasource: serviceLocator<UserLocalDatasource>()),
//   );

//   // ✅ Register Use Cases using IUserRepository
//   serviceLocator.registerFactory(
//     () => UserRegisterUsecase(userrepository: serviceLocator<IUserRepository>()),
//   );

//   serviceLocator.registerFactory(
//     () => UploadImageUsecase(userRepository: serviceLocator<IUserRepository>()),
//   );

//   // ✅ Register ViewModel
//   serviceLocator.registerFactory(
//     () => RegisterViewModel(
//       serviceLocator<UserRegisterUsecase>(),
//       serviceLocator<UploadImageUsecase>(),
//     ),
//   );
// }


// Future<void> _initSplashModule() async {
//   serviceLocator.registerFactory(() => SplashViewModel());
// }


import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
import 'package:mindwave/core/common/my_snackbar.dart/my_snackbar.dart';
import 'package:mindwave/core/network/api_service.dart';
import 'package:mindwave/core/network/hive_service.dart';

import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
import 'package:mindwave/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';

import 'package:mindwave/features/auth/data/repository/remote_repository/user_remote_repository.dart';

import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
import 'package:mindwave/features/auth/domain/use_case/get_current_user_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';

import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future initDependencies() async {
  _initCore(); // ✅ Register core services like ApiService
  await _initHiveService();
  await _initSharedPrefs();
  await _initAuthModule();
  await _initSplashModule();
}

void _initCore() {
  // Register Dio instance
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  // Register ApiService with Dio injected
  serviceLocator.registerLazySingleton<ApiService>(
    () => ApiService(serviceLocator<Dio>()),
  );
}

Future _initHiveService() async {
  serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
}
Future<void> _initSharedPrefs()async{
  final sharedPrefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPrefs);
  serviceLocator.registerLazySingleton(
    () => TokenSharedPrefs(sharedPreferences: serviceLocator<SharedPreferences>()),
  );
}

/// ✅ Main Auth Module Setup
Future _initAuthModule() async {
  // Data Sources
  serviceLocator.registerFactory(
    () => UserLocalDatasource(HiveService: serviceLocator<HiveService>()),
  );

  serviceLocator.registerFactory(
    () => UserRemoteDatasource(apiService: serviceLocator<ApiService>()),
  );

  // Repositories
  serviceLocator.registerFactory<IUserRepository>(
    () => UserRemoteRepository(userRemoteDatasource: serviceLocator<UserRemoteDatasource>()),
  );

  // Use Cases
  serviceLocator.registerFactory(
    () => UserLoginUsecase(
      userRepository: serviceLocator<IUserRepository>(),
      tokenSharedPrefs: serviceLocator<TokenSharedPrefs>(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserRegisterUsecase(userrepository: serviceLocator<IUserRepository>()),
  );

  serviceLocator.registerFactory(
    () => UploadImageUsecase(userRepository: serviceLocator<IUserRepository>()),
  );

  serviceLocator.registerFactory(
    () => GetCurrentUserUsecase(userRepository: serviceLocator<IUserRepository>()),
  );

  // ViewModel
  serviceLocator.registerFactory(
    () => RegisterViewModel(
      serviceLocator<UserRegisterUsecase>(),
      serviceLocator<UploadImageUsecase>(),
    ),
  );
}

/// ✅ Splash Module Setup
Future<void> _initSplashModule() async {
  serviceLocator.registerFactory(() => SplashViewModel());
}
=======
// }

// Future<void> _initSplashModule() async {
//   serviceLocator.registerFactory(() => SplashViewModel());
// }
>>>>>>> sprint3
