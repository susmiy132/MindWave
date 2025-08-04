// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
// import 'package:mindwave/features/auth/data/model/user_hive_model.dart';
// import 'package:path_provider/path_provider.dart';

// class HiveService {
//   Future<void> init() async {
//     // Initialize the databse
//     var directory = await getApplicationDocumentsDirectory();
//     var path = '${directory.path}mindWaveDB';

//     Hive.init(path);

//     // Register Adapters
//     Hive.registerAdapter(UserHiveModelAdapter());

//     Future<void> register(UserHiveModel auth) async {
//       var box = await Hive.openBox<UserHiveModel>(
//         HiveTableConstant.userBox
//       );
//       await box.put(auth.userId, auth);
//     }

//     Future<void> deleteAuth(String id) async {
//       var box = await Hive.openBox<UserHiveModel>(
//         HiveTableConstant.userBox,
//       );

//       return box.delete(id);
//     }

//     Future<List<UserHiveModel>> getAllAuth() async {
//       var box = await Hive.openBox<UserHiveModel>(
//         HiveTableConstant.userBox,
//       );
//       return box.values.toList();
//     }

//     // Login using email and password
//     Future<UserHiveModel?> login(String email, String password) async {
//       var box = await Hive.openBox<UserHiveModel>(
//         HiveTableConstant.userBox,
//       );
//       var user = box.values.firstWhere(
//         (element) => element.email == email && element.password == password,
//         orElse: () => throw Exception('Invald email or password')
//       );
//       box.close();
//       return user;
//     }

//     // Clear all data and delete database
//     Future<void> clearAll() async {
//       await Hive.deleteFromDisk();
//       await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
//     }

//     Future<void> close() async {
//       await Hive.close();
//     }
//   }

//   Future loginUser(String email, String password) async {}

//   Future<void> registerUser(UserHiveModel userModel) async {}

//   Future getUser() async {}

//   Future<void> clearUser() async {}
// }

import 'package:hive_flutter/hive_flutter.dart';
import 'package:mindwave/app/constant/hive/hive_table_constraint.dart';
import 'package:mindwave/features/auth/data/model/user_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/mindWaveDB';

    Hive.init(path);
    Hive.registerAdapter(UserHiveModelAdapter());
  }

  Future<void> registerUser(UserHiveModel user) async {
    final box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.put(user.userId, user);
    await box.close();
  }

  Future<UserHiveModel?> loginUser(String email, String password) async {
    final box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    try {
      final user = box.values.firstWhere(
        (user) => user.email == email && user.password == password,
        orElse: () => throw Exception('Invalid email or password'),
      );
      return user;
    } catch (e) {
      return null;
    } finally {
      await box.close();
    }
  }

  Future<List<UserHiveModel>> getAllUsers() async {
    final box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    final users = box.values.toList();
    await box.close();
    return users;
  }

  Future<UserHiveModel?> getUser(String userId) async {
    final box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    final user = box.get(userId);
    await box.close();
    return user;
  }

  Future<void> deleteUser(String userId) async {
    final box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.delete(userId);
    await box.close();
  }

  Future<void> clearUserData() async {
    final box = await Hive.openBox<UserHiveModel>(HiveTableConstant.userBox);
    await box.clear();
    await box.close();
  }

  Future<void> close() async {
    await Hive.close();
  }

  Future<void> deleteAllHiveData() async {
    await Hive.deleteFromDisk();
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  Future<void> clearUser() async {}

  Future getAllAuth() async {}

  Future<void> clearAll() async {}
}
