import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key}); 

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  String _inputDegrees = '';
  String _fahrenheitResult = '0.0';

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  void _convertToFahrenheit(String value) {
    setState(() {
      _inputDegrees = value;
      
      final double? celsius = double.tryParse(value);

      if (celsius == null) {
        _fahrenheitResult = 'Invalid Input';
      } else {
        double fahrenheit = (celsius * 9 / 5) + 32;
        _fahrenheitResult = fahrenheit.toStringAsFixed(2); // Show 2 decimal places
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees (C):", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),

            TextField(
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: _convertToFahrenheit, 
            ),
            
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit (F):", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _fahrenheitResult, 
                style: const TextStyle(
                  color: Colors.black, 
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
