import 'package:flutter/material.dart';

void main() {

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              GradientButton(
                text: "HELLO 1",
                start: Colors.blue,
                end: Colors.red, 
              ),
              GradientButton(
                text: "HELLO 2",
                start: Colors.blue,
                end: Colors.red, 
              ),
              GradientButton(
                text: "HELLO 3",
                start: Colors.blue,
                end: Colors.red, 
              ),
            ],
          ),
        ),
      ),
    ),
  );
 }
//st
class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.text, required this.start, required this.end});
  final String text;
  final Color start;
  final Color end;

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 300,
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                  colors: [start, end])
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                    ),
                  ),
                ),
              );
  }
}