// import 'package:dartz/dartz.dart';
// import 'package:mindwave/core/error/failure.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TokenSharedPrefs {
//   final SharedPreferences _sharedPreferences;

//   TokenSharedPrefs ({required SharedPreferences sharedPreferences})
//     : _sharedPreferences = sharedPreferences;

//     Future<Either<Failure, void>> saveToken(String token) async {
//       try {
//         await _sharedPreferences.setString('token', token);
//         return Right(null);
//       }catch(e){
//         return Left(
//           SharedPreferencesFailure(message: 'Failed to save token: $e')
//         );
//       }
//     }
    
// }