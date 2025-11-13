import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              HobbyCard(icon: Icons.travel_explore, text: 'travelling'),
              HobbyCard(icon: Icons.access_time, text: 'time', color: Colors.blueGrey,),
              HobbyCard(icon: Icons.add_a_photo, text: 'upload')
            ],
          ),
        ),
      ),
    )
  );
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.icon,
    required this.text,
    this.color = Colors.blue
  });
  final String text;
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsetsGeometry.all(30)),
          Icon(
            icon,
            color: Colors.white,
            size: 20, 
          ),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white, decoration: TextDecoration.none)
          )
        ],
      ),
      
      );
  }
}