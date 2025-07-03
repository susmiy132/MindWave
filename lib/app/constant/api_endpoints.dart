// class ApiEndpoints {
//   ApiEndpoints._();

//   // Timeouts
//   static const connectionTimeout = Duration(seconds: 1000);
//   static const receiveTimeout = Duration(seconds: 1000);

//   // For Android emulator (localhost of PC)
//   static const String serverAddress = "http://10.0.2.2:5050"; // <- port 5050

//   // Use this if running on a real device:
//   // static const String serverAddress = "http://192.168.1.x:5050";

//   // Auth Endpoints
//   static const String login = "auth/login";
//   static const String register = "auth/register";
//   static const String getAllAuth = "auth/getAllUser";
//   static const String updateUser = "auth/updateUser";
//   static const String deleteUser = "auth/deleteUser";
//   static const String uploadProfilePicture = "auth/uploadImage";

//   static String get baseUrl => serverAddress;
// }


// class ApiEndpoints {
//   ApiEndpoints._(); // Private constructor

//   // Timeouts
//   static const Duration connectionTimeout = Duration(seconds: 100);
//   static const Duration receiveTimeout = Duration(seconds: 100);

//   // ✅ Backend base URL (choose ONE)

//   // Use this for Android emulator
//   static const String serverAddress = 'http://10.0.2.2:5050';

//   // Use this instead if you're on a real device (same Wi-Fi)
//   // static const String serverAddress = 'http://192.168.1.x:5050'; // Replace with your IP

//   // static const String baseUrl = serverAddress;
//    static const String baseUrl = "$serverAddress/api/auth/register";

//   // Auth Endpoints
//   static const String login = "auth/login";
//   static const String register = "auth/register";
//   static const String getAllAuth = "auth/getAllUser";
//   static const String updateUser = "auth/updateUser";
//   static const String deleteUser = "auth/deleteUser";
//   static const String uploadProfilePicture = "auth/uploadImage";
// }

class ApiEndpoints {
  ApiEndpoints._(); // Prevent instantiation

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 100);
  static const Duration receiveTimeout = Duration(seconds: 100);

  // ✅ Correct base URL with trailing slash
  static const String baseUrl = "http://10.0.2.2:5050/api/";

  // ✅ Auth Endpoints
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  static const String uploadImage = "auth/uploadImage";

  // Image URL if needed
  static const String imageUrl = "${baseUrl}uploads/";
}

