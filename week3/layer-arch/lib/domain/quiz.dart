class Question{
  final String title;
  final List<String> choices;
  final Map<String, int> goodChoice;

  Question({required this.title, required this.choices, this.goodChoice = const {'q': 1}});
}

class Answer{
  final Question question;
  final String answerChoice;
  final String player;
  

  Answer({required this.question, required this.answerChoice, required this.player});

  bool isGood() => question.goodChoice.containsKey(answerChoice);
}

class Quiz{
  List<Question> questions;
  List <Player> players = [];


  Quiz({required this.questions});

  void addPlayer(Player player) {
    // Overwrite old player score if name exists
    players.removeWhere((p) => p.name == player.name);
    players.add(player);
  }
  
}

class Player {
  String name;
  List <Answer> answers =[];
  
  Player(this.name);

  int getScoreInPercentage(List<Question> questions){
    int totalSCore =0;
    for(Answer answer in answers){
      if (answer.isGood()) {
        totalSCore++;
      }
    }
    return ((totalSCore/ questions.length)*100).toInt();

  }

  int getScoreInPoint() {
    int totalScore =0;
    for(Answer answer in answers){
      if (answer.isGood()) {
        totalScore += answer.question.goodChoice[answer.answerChoice] ?? 0;
      }
    }
     return totalScore;
  }

  void addAnswer(Answer answer) {
     this.answers.add(answer);
  }

}