// import 'package:get_it/get_it.dart';
// import 'package:mindwave/core/network/hive_service.dart';
// import 'package:mindwave/features/auth/data/data_source/local_datasource/user_local_datasource.dart';
// import 'package:mindwave/features/auth/data/repository/local_repository/user_local_repository.dart';
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

//   // serviceLocator.registerFactory(
//   //   () => LoginViewModel(serviceLocator<UserLoginUsecase>()),
//   // );

//   // Future<void> _initSplashModule()async {
//   //   serviceLocator.registerFactory(() => SplashViewModel());
//   // }
// }

// Future<void> _initSplashModule() async {
//   serviceLocator.registerFactory(() => SplashViewModel());
// }