// import 'package:dio/dio.dart';
// import 'package:mindwave/app/constant/api_endpoints.dart';
// import 'package:mindwave/app/constant/dio_error_interceptor.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class ApiService {
//   final Dio _dio;

//   Dio get dio => _dio;

//   ApiService(this._dio) {
//     _dio
//       ..options.baseUrl = ApiEndpoints.baseUrl
//       ..options.connectTimeout = ApiEndpoints.connectionTimeout
//       ..options.receiveTimeout = ApiEndpoints.receiveTimeout
//       ..interceptors.add(DioErrorInterceptor())
//       ..interceptors.add(
//         PrettyDioLogger(
//           requestHeader: true,
//           requestBody: true,
//           responseHeader: true,
//         ),
//       )
//       ..options.headers = {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       };
//   }

//   // Add register user API call here:
//   Future<Response> registerUser({
//     required String fullName,
//     required String email,
//     required String phone,
//     required String password
//     // required String profileImage

//   }) async {
//     try{
//       final data = {
//         "fullName": fullName,
//         "email" : email,
//         "phone": phone,
//         "password": password
//         // "profileImage": profileImage,
//       };
//       final response = await _dio.post(
//         '/api/auth/register',
//         data: data,
//       );
//       return response;
//     } on DioException catch(e){
//       print("Caught DioException: ${e.message}");
//       rethrow;
//       // You can handle/ log error here or just rethrow
      
//     }
//   }
// }
