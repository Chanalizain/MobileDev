import 'dart:io';
class Robot {
  int x;
  int y;
  late int directionIndex;
  List <String> directions = ["NORTH", "EAST", "SOUTH", "WEST"];

  Robot(this.x, this.y, String direction) {
    directionIndex = directions.indexOf(direction);
  }

  void turnRight() {
    directionIndex = (directionIndex + 1) % 4;
  }
  void turnLeft() {
    directionIndex = (directionIndex + 3) % 4;
  }
  void advance() {
    switch(directionIndex) {
      case 0:
        y += 1;
        break;
      case 1:
        x +=1;
        break;
      case 2:
        y -=1;
        break;
      case 3:
        x -=1;
        break;
    }
  }
  void proccessInstruction(Robot robot, String instructions) {
    for(var instruction in instructions.split('')) {
      switch (instruction) {
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'A':
          advance();
          break;
      }
    }
  }
  void showResult(){
    print('Coordinate: ($x,$y)');
    print('Direction:' + ' ' + directions[directionIndex]);
  }
}

void main() {
  // read inputs
  print('Enter initial X: ');
  int x = int.parse(stdin.readLineSync()!);

  print('Enter initial Y: ');
  int y = int.parse(stdin.readLineSync()!);

  print('Enter the direction: ');
  String direction = stdin.readLineSync()!.toUpperCase();

  print('Enter the instruction: ');
  String instructions = stdin.readLineSync()!.toUpperCase();

  // create robot
  Robot r = Robot(x, y, direction);
  r.proccessInstruction(r, instructions);
  
  // print results
  print("final result");
  r.showResult();
}
//enum direction
//enum action
//class Robot with overide to string to return some defualt value of the robot initial value that is initialize in the constructor