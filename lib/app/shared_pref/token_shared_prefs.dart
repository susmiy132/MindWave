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

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mindwave/core/error/failure.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  static const _tokenKey = 'token';

  /// Save token
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _sharedPreferences.setString(_tokenKey, token);
      return Right(null);
    } catch (e) {
      return Left(
        SharedPreferencesFailure(message: 'Failed to save token: $e'),
      );
    }
  }

  /// Get token
  Future<Either<Failure, String>> getToken() async {
    try {
      final token = _sharedPreferences.getString(_tokenKey);
      if (token == null || token.isEmpty) {
        return Left(
          SharedPreferencesFailure(message: 'Token not found'),
        );
      }
      return Right(token);
    } catch (e) {
      return Left(
        SharedPreferencesFailure(message: 'Failed to get token: $e'),
      );
    }
  }

  /// Remove token (logout)
  Future<Either<Failure, void>> removeToken() async {
    try {
      await _sharedPreferences.remove(_tokenKey);
      return Right(null);
    } catch (e) {
      return Left(
        SharedPreferencesFailure(message: 'Failed to remove token: $e'),
      );
    }
  }
}
