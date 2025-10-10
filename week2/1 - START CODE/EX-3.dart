void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code

  const int passing = 50;
  // anonymous function 
  Iterable<int> passingScoresCheck = scores.where((score) => score >= passing);

  // convert the Iterable to a List<int> as requested for the output[cite: 142].
  List<int> passingStudents = passingScoresCheck.toList();

  int studentsPassedCount = passingStudents.length;

  print(passingStudents);
  print('$studentsPassedCount students passed');

}