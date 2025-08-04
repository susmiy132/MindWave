// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mindwave/app/shared_pref/token_shared_prefs.dart';
// import 'package:mindwave/core/network/api_service.dart';
// import 'package:mindwave/core/network/hive_service.dart';

// import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
// import 'package:mindwave/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';

// import 'package:mindwave/features/auth/data/repository/local_repository/user_local_repository.dart';
// import 'package:mindwave/features/auth/data/repository/remote_repository/user_remote_repository.dart';

// import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
// import 'package:mindwave/features/auth/domain/use_case/get_current_user_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
// import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';

// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
// import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
// import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final serviceLocator = GetIt.instance;

// Future<void> initDependencies() async {
//   _initCore();
//   await _initHiveService();
//   await _initSharedPrefs();
//   await _initAuthModule();
//   await _initSplashModule();
// }

// void _initCore() {
//   serviceLocator.registerLazySingleton<Dio>(() => Dio());
//   serviceLocator.registerLazySingleton<ApiService>(
//     () => ApiService(serviceLocator<Dio>()),
//   );
// }

// Future<void> _initHiveService() async {
//   serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
// }

// Future<void> _initSharedPrefs() async {
//   final sharedPrefs = await SharedPreferences.getInstance();
//   serviceLocator.registerLazySingleton(() => sharedPrefs);
//   serviceLocator.registerLazySingleton(
//     () => TokenSharedPrefs(sharedPreferences: serviceLocator<SharedPreferences>()),
//   );
// }

// Future<void> _initAuthModule() async {
//   // Data Sources
//   serviceLocator.registerFactory(
//     () => UserLocalDatasource(HiveService: serviceLocator<HiveService>()),
//   );
//   serviceLocator.registerFactory(
//     () => UserRemoteDatasource(apiService: serviceLocator<ApiService>()),
//   );

//   // Repositories
//   serviceLocator.registerFactory<UserRemoteRepository>(
//     () => UserRemoteRepository(userRemoteDatasource: serviceLocator<UserRemoteDatasource>()),
//   );
//   serviceLocator.registerFactory<UserLocalRepository>(
//     () => UserLocalRepository(localDatasource: serviceLocator<UserLocalDatasource>()),
//   );

//   // Use Cases
//   serviceLocator.registerFactory(
//     () => UserLoginUsecase(
//       userRepository: serviceLocator<UserRemoteRepository>(),
//       tokenSharedPrefs: serviceLocator<TokenSharedPrefs>(),
//     ),
//   );
//   serviceLocator.registerFactory(
//     () => UserRegisterUsecase(userrepository: serviceLocator<UserRemoteRepository>()),
//   );
//   serviceLocator.registerFactory(
//     () => UploadImageUsecase(userRepository: serviceLocator<UserRemoteRepository>()),
//   );
//   serviceLocator.registerFactory(
//     () => GetCurrentUserUsecase(userRepository: serviceLocator<UserRemoteRepository>()),
//   );

//   // ViewModels
//   serviceLocator.registerFactory(
//     () => LoginViewModel(serviceLocator<UserLoginUsecase>()),
//   );
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
import 'package:mindwave/core/network/api_service.dart';
import 'package:mindwave/core/network/hive_service.dart';
import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
import 'package:mindwave/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:mindwave/features/auth/data/repository/local_repository/user_local_repository.dart';
import 'package:mindwave/features/auth/data/repository/remote_repository/user_remote_repository.dart';
import 'package:mindwave/features/auth/domain/repository/user_repository.dart';
import 'package:mindwave/features/auth/domain/use_case/get_current_user_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/login_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/register_usecase.dart';
import 'package:mindwave/features/auth/domain/use_case/upload_profile_image_usecase.dart';
import 'package:mindwave/features/auth/presentation/view/login_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:mindwave/features/home/presentation/view_model/home_view_model.dart'; // ✅ Import HomeViewModel
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  await _initHiveService();
  await _initSharedPrefs();
  await _initAuthModule();
  await _initSplashModule();
  await _initHomeModule(); // ✅ Register HomeViewModel
}

void _initCore() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiService>(
    () => ApiService(serviceLocator<Dio>()),
  );
}

Future<void> _initHiveService() async {
  serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
}

Future<void> _initSharedPrefs() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPrefs);
  serviceLocator.registerLazySingleton(
    () => TokenSharedPrefs(sharedPreferences: serviceLocator<SharedPreferences>()),
  );
}

Future<void> _initAuthModule() async {
  // Data Sources
  serviceLocator.registerFactory(
    () => UserLocalDatasource(HiveService: serviceLocator<HiveService>()),
  );
  serviceLocator.registerFactory(
    () => UserRemoteDatasource(apiService: serviceLocator<ApiService>()),
  );

  // Repositories
  serviceLocator.registerFactory<UserRemoteRepository>(
    () => UserRemoteRepository(userRemoteDatasource: serviceLocator<UserRemoteDatasource>()),
  );
  serviceLocator.registerFactory<UserLocalRepository>(
    () => UserLocalRepository(localDatasource: serviceLocator<UserLocalDatasource>()),
  );

  // Use Cases
  serviceLocator.registerFactory(
    () => UserLoginUsecase(
      userRepository: serviceLocator<UserRemoteRepository>(),
      tokenSharedPrefs: serviceLocator<TokenSharedPrefs>(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserRegisterUsecase(userrepository: serviceLocator<UserRemoteRepository>()),
  );
  serviceLocator.registerFactory(
    () => UploadImageUsecase(userRepository: serviceLocator<UserRemoteRepository>()),
  );
  serviceLocator.registerFactory(
    () => GetCurrentUserUsecase(userRepository: serviceLocator<UserRemoteRepository>()),
  );

  // ViewModels
  serviceLocator.registerFactory(
    () => LoginViewModel(serviceLocator<UserLoginUsecase>()),
  );
  serviceLocator.registerFactory(
    () => RegisterViewModel(
      serviceLocator<UserRegisterUsecase>(),
      serviceLocator<UploadImageUsecase>(),
    ),
  );
}

Future<void> _initSplashModule() async {
  serviceLocator.registerFactory(() => SplashViewModel());
}

// ✅ Home Module
Future<void> _initHomeModule() async {
  serviceLocator.registerFactory(() => LoginViewScreen());
}
