class Question {
  String title;
  List <String> choices;
  String goodChoice;

  Question(this.title, this.choices, this.goodChoice);
}

class Answer {
  String answerChoice;
  bool isGoodAnswer;

  Answer(this.answerChoice, this.isGoodAnswer);
}

class Quiz {
  List<Question> questions = [];
  List<Answer> answers = [];
  
  void addQuestion(Question question) {
    questions.add(question);
  }

  void answerQuestion(int questionIndex, String userChoice) {
    Question q = questions[questionIndex];
    bool isCorrect = (userChoice == q.goodChoice);
    answers.add(Answer(userChoice, isCorrect));
  }

  int calculateScore() {
    int correct = 0;

    for(var answer in answers) {
      if(answer.isGoodAnswer) correct ++;
    }
    return correct ++;
  }

}

void main(){
  Quiz quiz = Quiz();
  quiz.addQuestion(Question('how many days in a week?', ['7', '6'], '7'));
  quiz.answerQuestion(0, '7');

  print('you got ${quiz.calculateScore()}');
}