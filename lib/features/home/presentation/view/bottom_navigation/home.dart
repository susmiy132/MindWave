import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
<<<<<<< HEAD
            child:
              Image.asset('assets/images/graph.png', 
=======
            child: Image.asset(
              'assets/Charts.png', 
>>>>>>> sprint3
              width: 550,
              height: 340,
              fit: BoxFit.contain,
            ),
<<<<<<< HEAD
            
=======
>>>>>>> sprint3
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildDashboardButton("Guided Meditaion"),
                _buildDashboardButton("Mood Tracker"),
                _buildDashboardButton("Journaling"),
                _buildDashboardButton("Progress"),
              
              ],
            ),
          ),
          Spacer(),
        ]
      )

    
    );
  }
  Widget _buildDashboardButton(String text){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.purple.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {

        }, 

        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );

  }
}