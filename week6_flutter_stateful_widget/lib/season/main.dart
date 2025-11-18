import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey, width:2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'SEASON',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CountrySeasonCard(country: 'France'),
                    CountrySeasonCard(country: 'Cambodia'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> seasonImages = [
  'assets/images/seasons/spring.png',
  'assets/images/seasons/summer.png',
  'assets/images/seasons/autumn.png',
  'assets/images/seasons/winter.png',
];

class CountrySeasonCard extends StatefulWidget {
  final String country;

  const CountrySeasonCard({super.key, required this.country});

  @override
  State<CountrySeasonCard> createState() => _CountrySeasonCardState();
}

class _CountrySeasonCardState extends State<CountrySeasonCard> {
  int currentSeasonIndex = 0;

  String get currentImagePath => seasonImages[currentSeasonIndex];

  void nextSeason() {
    setState(() {
      currentSeasonIndex = (currentSeasonIndex + 1) % seasonImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              GestureDetector( // allows the image to be clickable
                onTap: nextSeason, 
                child: Image.asset(
                  currentImagePath, 
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.country, 
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}