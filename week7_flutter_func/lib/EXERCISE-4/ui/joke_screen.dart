import 'package:flutter/material.dart';
import '../data/jokes.dart'; 
import '../model/joke_model.dart'; 

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {

  final List<Joke> jokes = jokeList; 
  
  void _toggleBestJoke(int jokeId) {
    setState(() {
      Joke? oldBestJoke;
      for (var joke in jokes) {
        if (joke.isBest) {
          oldBestJoke = joke;
          break;
        }
      }
 
      final tappedJoke = jokes.firstWhere((joke) => joke.id == jokeId);
      
      if (oldBestJoke == tappedJoke) {
        tappedJoke.isBest = false;
      } else {
        if (oldBestJoke != null) {
          oldBestJoke.isBest = false;
        }
        tappedJoke.isBest = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Jokes"),
        backgroundColor: Colors.green[300], 
      ),
      body: ListView.builder( 
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          
          return JokeCard(
            joke: joke, 
            onFavoriteClick: _toggleBestJoke, 
          );
        },
      ),
    );
  }
}

class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    required this.joke,
    required this.onFavoriteClick,
  });

  final Joke joke; 
  // Receives the callback function
  final void Function(int) onFavoriteClick; 

  @override
  Widget build(BuildContext context) {
    Color appColor = Colors.green[300] as Color; 
    
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title, 
                  style: TextStyle(
                    color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description) 
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onFavoriteClick(joke.id); 
            },
            icon: Icon(
              joke.isBest ? Icons.favorite : Icons.favorite_border,
              color: joke.isBest ? Colors.red : Colors.grey,
            ))
        ],
      ),
    );
  }
}