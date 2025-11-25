import 'package:flutter/material.dart';
import 'package:week7_flutter_func/EXERCISE-2/ui/screens/temperature_screen.dart';

import 'ui/screens/welcome_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {

  bool isStarted = false;

  void setIsStarted(){
    setState(() {
      isStarted = true;
    });
  }
  @override
  Widget build(context) {

    Widget contentScreen = isStarted
        ? TemperatureScreen() 
        : WelcomeScreen(onStartPressed: setIsStarted);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: contentScreen, 
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
