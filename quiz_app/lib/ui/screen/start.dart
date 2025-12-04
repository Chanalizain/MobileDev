import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // Parameter: OnStart: voidCallback
  final VoidCallback onStart;

  const StartScreen({required this.onStart, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("asset/Flutter-Logo-Small.png"),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: onStart, // Uses the passed-in callback
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Start Quiz', style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}