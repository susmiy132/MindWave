import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwave/features/auth/presentation/view/login_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  
  final _gap = const SizedBox(height: 8,);
  final _key = GlobalKey<FormState>();
  final fullnameController = TextEditingController(text: 'susmita rana');
  final emailController = TextEditingController(text: 'susmitarana12@gmail.com');
  final phoneController = TextEditingController(text: '9804677534');
  final passwordController = TextEditingController(text: 'susmita123');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context, 
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          )
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {}, 
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        radius: 50,
                        // backgroundImage: _img != null
                        //     ? FileImage(_img!)
                        //     : const AssetImage('assets/images/profile.png')
                        //         as ImageProvider,

                        backgroundImage: 
                          const AssetImage('assets/image/profile.png')
                          as ImageProvider,
                      ),
                    ),
                  ),
                  _gap,
                  TextFormField(
                    controller: fullnameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: ((value) {
                      if(value == null || value.isEmpty) {
                        return 'Please enter full name';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: ((value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter an email';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    validator: ((value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter phone number';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: ((value) {
                      if(value == null || value.isEmpty) {
                        return 'Please enter you password';
                      }
                      return null;
                    }),
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_key.currentState!.validate()) {
                          context.read<RegisterViewModel>().add(
                            RegisterUserEvent(
                              context: context, 
                              fullName: fullnameController.text, 
                              email: emailController.text, 
                              phone: phoneController.text, 
                              password: passwordController.text
                            ),
                          );
                        }
                      }, 
                      child: const Text('Register'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginViewScreen()),
                          );
                        },
                        child: Text(
                          "Login", 
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ), 
          ),
        )
      ),
    );
  }
}