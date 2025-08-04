// lib/view/splash_view.dart
import 'package:flutter/material.dart';
import 'package:mindwave/features/splash/presentation/view_model/splash_view_model.dart';

class SplashViewScreen extends StatefulWidget {
  const SplashViewScreen({super.key});

  @override
  State<SplashViewScreen> createState() => _SplashViewScreenState();
}

class _SplashViewScreenState extends State<SplashViewScreen> {
  final SplashViewModel _viewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset('assets/images/mindwave.png',
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),

            // SizedBox(
            //   height: 200,
            //   width: 200,
            //   child: CircleAvatar(
            //     radius: 50,
            //             // backgroundImage: _img != null
            //             //     ? FileImage(_img!)
            //             //     : const AssetImage('assets/images/profile.png')
            //             //         as ImageProvider,

            //     backgroundImage: 
            //     const AssetImage('assets/MindWavelogo.png')
            //     as ImageProvider,
            //   ),
            // ),
            // Icon(Icons.mood, size: 100, color: Colors.white),
            // const SizedBox(height: 20),
            // const Text(
            //   "MindWave",
            //   style: TextStyle(
            //     fontSize: 32,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
