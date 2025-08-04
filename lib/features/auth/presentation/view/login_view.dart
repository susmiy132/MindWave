import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/features/auth/presentation/view/register_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:mindwave/features/home/presentation/view/home_view_screen.dart';

class LoginViewScreen extends StatelessWidget {
  LoginViewScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: 'susmitarana12@gmail.com');
  final passwordController = TextEditingController(text: 'susmita123');

  final _gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        radius: 50,
                        // backgroundImage: _img != null
                        //     ? FileImage(_img!)
                        //     : const AssetImage('assets/images/profile.png')
                        //         as ImageProvider,

                        backgroundImage: 
                          const AssetImage('assets/images/profile.jpg')
                          as ImageProvider,
                      ),
                    ),
                    _gap,
                    
                    const Text(
                      'Profile Picture',
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat Bold'),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'email',
                      ),
                      validator: ((value) {
                        if(value!.isEmpty){
                          return 'Please enter an email';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: ((value) {
                        if(value == null || value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                      MaterialPageRoute(builder: (context) => HomeViewScreen()),
                    );
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginViewModel>().add(
                            LoginWithEmailAndPasswordEvent(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      }, 
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat Bold',
                            ),
                          ),  
                        ),
                      ),
                    ),
                    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterView()),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ]
              ),
                  ],
                ),
              ),
            ),
          )
        )
      ),
    );
  }
}























// // lib/view/login_view.dart
// import 'package:flutter/material.dart';
// import 'package:mindwave/features/auth/presentation/view/register_view.dart';
// import 'package:mindwave/features/auth/presentation/view_model/login_view_model/login_view_model.dart';
// import 'package:mindwave/bottom_navigation/dashboard.dart';

// class LoginViewSceen extends StatefulWidget {
//   const LoginViewSceen({super.key});

//   @override
//   State<LoginViewSceen> createState() => _LoginViewSceenState();
// }

// class _LoginViewSceenState extends State<LoginViewSceen> {
//   final LoginViewModel _viewModel = LoginViewModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "Login Page",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.purple.shade900,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Form(
//           key: _viewModel.formKey,
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 margin: const EdgeInsets.all(16),
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
//                 controller: _viewModel.emailController,
//                 decoration: InputDecoration(
//                   labelText: "Email Address",
//                   border: const UnderlineInputBorder(),
//                   focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.purple.shade900)),
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey.shade600)),
//                 ),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Please enter an email' : null,
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _viewModel.passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   border: const UnderlineInputBorder(),
//                   focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.purple.shade900)),
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey.shade600)),
//                 ),
//                 obscureText: true,
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Please enter a password' : null,
//               ),
//               ListTile(
//                 title: const Text('Remember me'),
//                 leading: Radio<String>(
//                   value: 'remember',
//                   groupValue: _viewModel.selectedOption,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _viewModel.selectedOption = value;
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
//                   onPressed: () async {
//                     if (_viewModel.formKey.currentState!.validate()) {
//                       bool success = await _viewModel.login();
//                       if (success) {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (_) => const DashboardBottomScreen()),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text("Invalid credentials")),
//                         );
//                       }
//                     }
//                   },
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => RegisterView()),
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
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
