void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code

  const int passing = 50;
  // anonymous function 
  // iterable is a collection of elements, doesn't store all elements in memory
  Iterable<int> passingScoresCheck = scores.where((score) => score >= passing);

  // convert the Iterable to a List<int> 
  List<int> passingStudents = passingScoresCheck.toList();

  // or just create a direct list 
  // List<int> passingStudents = scores.where((score) => score >= passing).toList();

  int studentsPassedCount = passingStudents.length;

  print(passingStudents);
  print('$studentsPassedCount students passed');

}