class Joke {
  final int id;
  final String title;
  final String description;
  bool isBest;

  Joke({
    required this.id,
    required this.title,
    required this.description,
    this.isBest = false,
  });
}