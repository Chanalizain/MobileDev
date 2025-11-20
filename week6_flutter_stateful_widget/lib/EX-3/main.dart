import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/w4-s2/bird.jpg",
  "assets/images/w4-s2/bird2.jpg",
  "assets/images/w4-s2/insect.jpg",
  "assets/images/w4-s2/girl.jpg",
  "assets/images/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: Gallery()
    )
  );

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  
  int currentIndex = 0;

  void goToPreviousImage() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length - 1;
      } else {
        currentIndex--;
      }
    });
  }

  void goToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: goToPreviousImage,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: goToNextImage,
              ),
            ),
          ],
        ),
        body: Image.asset(images[currentIndex]),
      );
  }
}

