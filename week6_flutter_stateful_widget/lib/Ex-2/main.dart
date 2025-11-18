import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
 }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Favorite cards',),
        ),
        body: Column(
          children: [
            FavCard(title: 'tv show', description: 'whateverkajhkeal'),
            FavCard(title: 'tv show', description: 'whateverkajhkeal'),
          ],
        ),
      )
    );
  }
}

class FavCard extends StatefulWidget {
  const FavCard({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {

  bool isFav = false;

  void toogleFav(){
    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {

    final Color iconColor = isFav ? Colors.red : const Color.fromARGB(255, 214, 213, 213);
    
    return SizedBox(
          height: 70,

          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.fromLTRB(10, 10, 0, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title, style: TextStyle(fontSize:16.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                        Text(widget.description),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: toogleFav, 
                    icon: Icon(
                      Icons.favorite,
                      color: iconColor, 
                    )
                    )
                ],
              ),
            ),
          ),
          
        );
  }
}
