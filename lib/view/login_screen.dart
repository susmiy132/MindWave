// import 'package:flutter/material.dart';
// import 'package:mindwave/View/register_screen.dart';
// import 'package:mindwave/bottom_navigation/dashboard.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_state.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});


//   LoginState copyWith({required bool isLoading}) {}
//   @override

//   LoginState copyWith({required bool isLoading}) {}
//   State<LoginScreen> createState() => _LoginScreenState();

//   LoginState copyWith({required bool isLoading}) {}
// }


// class _LoginScreenState extends State<LoginScreen> {
//   // int first = 0;
//   // int second = 0;
//   int result = 0;
//   String? _selectedOption;

//   // use textEditing Controller

//   final emailcontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();

//   // step 1 key 
//   final myKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Login Page",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.purple.shade900,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Form(
//           key: myKey,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white
//                 ),
//                 margin: EdgeInsets.all(16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image.asset(
//                       'assets/MindWavelogo.png',
//                       width: 230,
//                       height: 100,
//                       fit: BoxFit.contain,

//                     ),
//                   ],
//                 ),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Email Address",
//                   border: UnderlineInputBorder(),  // this line of code creates the underline of the text.
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.purple.shade900)
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey.shade600)
//                   )
//                 ),
//                 // keyboardType: TextInputType.numberWithOptions(),
//                 controller: emailcontroller,
//                 validator: (value) {
//                   if(value == null || value.isEmpty){
//                     return 'please enter an email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 8,),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
//                   border: UnderlineInputBorder(),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.purple.shade900)
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey.shade600)
//                   ),
//                 ),
//                 // keyboardType: TextInputType.numberWithOptions(),
//                 controller: passwordcontroller,
//                 validator: (value) {
//                   if(value == null || value.isEmpty) {
//                     return 'please enter a password';
//                   }
//                   return null;
//                 },
//               ),
//               ListTile(
//                 title: const Text('Remember me'),
//                 leading: Radio<String>(
//                   value: 'remember',
//                   groupValue: _selectedOption,
//                   onChanged: (String? value){
//                     setState(() {
//                       _selectedOption = value;
//                     });
//                   },
//                 ),

//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple.shade900,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
    
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => DashboardBottomScreen()),
//                     );
//                     if (myKey.currentState!.validate())
//                     {
//                       // Logic
//                       int email = int.parse(emailcontroller.text);
//                       int password = int.parse(passwordcontroller.text);
//                       setState(() {
//                         result = email + password;
//                       }
//                       );
//                     }
//                   }, 
//                   child: Text(
//                     "Login",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   )
//                   ),
//               ),
              
//               SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => RegisterScreen()),
//                       );
//                     },
//                     child: Text(
//                       "Register",
//                       style: TextStyle(
//                         color: Colors.purple.shade900,
//                         fontWeight: FontWeight.bold,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ]
//               ),
//             ],

//           ), 
//         )
//       ),
//     );
//   }
// }
