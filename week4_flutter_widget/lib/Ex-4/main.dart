import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            CustomCard(name: "OOP"),
            CustomCard(name: "Dart", color: Color(0xFF64B5F6)),
            CustomCard(name: "FLUTTER", color: Color(0xFF1E88E5),)
          ],
        ),
      )
    )
  );
}

class CustomCard extends StatelessWidget {
  final String name;
  final Color color;

  const CustomCard({
    required this.name,
    this.color = const Color(0xFFBBDEFB), 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(vertical: 20.0), 
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color, 
        ),
        child: Center(
          child: Text(
            name, 
            style: TextStyle(
              fontSize: 24, 
              color: Colors.white,
              decoration: TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}
