import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            NewWidget(icon: Icons.travel_explore_sharp, text: 'travelling', color: Colors.green),
            SizedBox(height: 30,),
            NewWidget(icon: Icons.travel_explore_sharp, text: 'travelling', color: Colors.green),
          ],
        )
      )
    )
  );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color
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