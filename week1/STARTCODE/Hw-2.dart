import 'dart:io';

bool isBalanced(String string) {
  List<String> stack = [];

  for (var char in string.split('')) {
    if (char == '(' || char == '{' || char == '[') {
      stack.add(char);
    }
    else if (char == ')' || char == '}' || char == ']') {
      if (stack.isEmpty) return false;

      var top = stack.removeLast();
      if (char == ')' && top != '(') return false;
      if (char == '}' && top != '{') return false;
      if (char == ']' && top != '[') return false;
    }
    else {
      continue;
    }
  }
  return stack.isEmpty;
}

void main() {
print ("Enter a string: ");
String string = stdin.readLineSync()!;
print('isBalanced?');
print(isBalanced(string));
}