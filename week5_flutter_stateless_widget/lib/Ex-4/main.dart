import 'package:flutter/material.dart';

enum City {
  PhnomPenh(
    'PhnomPenh',
    'assets/images/ex4/cloudy.png',
    'Min 10.0 °C',
    'Max 30.0 °C',
    '12.2 °C'
  ), 
  Paris(
    'paris',
    'assets/images/ex4/sunnyCloudy.png',
    'Min 10.0 °C',
    'Max 40.0 °C',
    '22.2 °C'
  ), 
  Rome(
    'Rome',
    'assets/images/ex4/sunny.png',
    'Min 10.0 °C',
    'Max 40.0 °C',
    '45.2 °C'
  ),
  Toulouse(
    'Toulouse',
    'assets/images/ex4/veryCloudy.png',
    'Min 10.0 °C',
    'Max 40 °C',
    '45.2 °C'
  );

  final String city;
  final String imagePath;
  final String min;
  final String max;
  final String temp;

  const City(this.city, this.imagePath, this.min, this.max, this.temp);
}
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                icon: const Icon(
                  Icons.menu, 
                  color: Colors.white, 
                ),
                onPressed: () {
                  print('Menu icon pressed!');
                },
              )
            )
          ],     
        ),
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          // padding: EdgeInsets.only(top: 10),
          children: [
            WeatherCard(city: City.PhnomPenh,color: const Color.fromARGB(255, 228, 186, 235),),
            WeatherCard(city: City.Paris, color: const Color.fromARGB(255, 252, 144, 134),),
            WeatherCard(city: City.Rome, color: const Color.fromARGB(255, 168, 214, 253),),
            WeatherCard(city: City.Toulouse)
          ],
        ),
      ),
    )
  );
}

class WeatherCard extends StatelessWidget {
  WeatherCard({super.key, this.color = const Color.fromARGB(255, 99, 247, 205), required this.city});
  
   Color color;
   City city;

   Widget _buildWeatherContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ClipOval(
            child: Image.asset(city.imagePath, width: 80, height: 80,),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 30, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              city.city,
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
              city.min,
              style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
              city.max,
              style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only( right: 16),
          child: Text(
            city.temp,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,color: Colors.white),
            ),
        )

      ],
    );
   }

  // Helper function to dynamically generate a darker shade for the gradient end
  Color _getEndColor(Color startColor) {
    return HSLColor.fromColor(startColor).withLightness(
      (HSLColor.fromColor(startColor).lightness + 0.1).clamp(0.0, 0.6)
    ).toColor();
  }
  @override
  Widget build(BuildContext context) {
    final Color startColor = color;
    final Color endColor = _getEndColor(color);

    return SizedBox(
      height: 200,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: PhysicalModel(
          //shadow when card work with gradient
          color: Colors.transparent, 
          borderRadius: BorderRadius.circular(20.0),
          elevation: 8.0, 
          shadowColor: Colors.black,

          child: Container(
            //background
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [startColor, endColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            
            //content
            child: Card(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: _buildWeatherContent(),
            ),
          ),
        ),
      )
    );
  }
}