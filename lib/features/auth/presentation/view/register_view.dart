<<<<<<< HEAD
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mindwave/features/auth/presentation/view/login_view.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_event.dart';
import 'package:mindwave/features/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 8,);

  final _key = GlobalKey<FormState>();

  final fullnameController = TextEditingController(text: 'susmita rana');

  final emailController = TextEditingController(text: 'susmitarana12@gmail.com');

  final phoneController = TextEditingController(text: '9804677534');

  final passwordController = TextEditingController(text: 'susmita123');

  // check for camera permission and gallery permission
  Future<void> _checkPermissions() async {
    if(await Permission.camera.request().isRestricted && 
      await Permission.storage.request().isDenied) {
    await Permission.camera.request();
    await Permission.storage.request();
    }
  }

  File? _img;
  Future<void> _browseImage(ImageSource imageSource) async {
    try{
      final image = await ImagePicker().pickImage(source: imageSource);
      if(image != null) {
        setState(() {
          _img =File(image.path);
          // Send this image to the server or use it as needed
        });
      }
    } catch (e) {
      // Handle any errors that occur during image selection
      print('Error selecting image: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
=======
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
>>>>>>> sprint3
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
<<<<<<< HEAD
                                onPressed: () {
                                  _checkPermissions().then((_) {
                                    _browseImage(ImageSource.camera);
                                  });
                                  Navigator.pop(context);
                                }, 
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera')),

                              ElevatedButton.icon(
                                onPressed: () {
                                  _checkPermissions().then((_) {
                                    _browseImage(ImageSource.gallery);
                                  });
                                  Navigator.pop(context);
                                }, 
=======
                                onPressed: () {}, 
>>>>>>> sprint3
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
<<<<<<< HEAD
                        backgroundImage: _img != null
                            ? FileImage(_img!)
                            : const AssetImage('assets/images/profile.jpg')
                                as ImageProvider,

                        // backgroundImage: 
                        //   const AssetImage('assets/images/profile.jpg')
                        //   as ImageProvider,
=======
                        // backgroundImage: _img != null
                        //     ? FileImage(_img!)
                        //     : const AssetImage('assets/images/profile.png')
                        //         as ImageProvider,

                        backgroundImage: 
                          const AssetImage('assets/image/profile.png')
                          as ImageProvider,
>>>>>>> sprint3
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
<<<<<<< HEAD
                  _gap, 
                  
=======
                  _gap,
>>>>>>> sprint3
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
<<<<<<< HEAD
                 
=======
>>>>>>> sprint3
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