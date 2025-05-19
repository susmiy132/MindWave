import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Dashboard",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,



      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              'assets/Charts.png', 
              width: 550,
              height: 340,
              fit: BoxFit.contain,
            ),
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

          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple.shade900,
            ),
            margin: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconColumn(Icons.cabin_outlined, "Home", Colors.white),
                _buildIconColumn(Icons.notification_add, "notice", Colors.white),
                _buildIconColumn(Icons.account_circle_sharp, "profile", Colors.white),
              ],
            ),
          )
        ],
      ),
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


  Widget _buildIconColumn(IconData icon, String label, Color color){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color,),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color
          ),
        ),
      ],
    );
  }
}