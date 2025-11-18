import 'package:flutter/material.dart';

void main(){
  runApp(SelectableButtonApp());
}

class SelectableButtonApp extends StatelessWidget {
  const SelectableButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful widget - Button'),),
        body: Column(
          children: [
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton(),
            SizedBox(height: 20),
            SelectableButton()
          ],
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;//state
  Color get buttonColor => isSelected ? Colors.blue : const Color.fromARGB(255, 192, 228, 245);//computed value
  String get buttonText => isSelected ? "Selected" : "Not Selected";//computed value

  void onclick() {
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: onclick,

          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor, 
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),  

          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ),
      ),
    );
  }
}