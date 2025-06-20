import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 140,
          width: double.infinity,
          child: Card(
            color: Colors.deepPurple,
            child: Text(
              "This is your notice",
              style: TextStyle(
                color: Colors.white, 
              ),

            ),
          ),
        )
      ),
    
    );
  }
}