class CustomDuration {
  final int _miliseconds;

  const CustomDuration._(this._miliseconds);
  //note: initializer list use to include assertions to enforce rules before any logic in the body.
  //ini list work safely with final field
  CustomDuration.fromHours(int hours)
      : assert(hours>0, 'Duration cannot be negative'),
        _miliseconds = hours * 60 * 60 * 1000;

  CustomDuration.fromMinutes(int minutes)
      : assert(minutes>0, 'Duration cannot be negative'),
        _miliseconds = minutes * 60 * 1000;

  CustomDuration.fromSeconds(int seconds)
      : assert(seconds>0, 'Duration cannot be negative'),
        _miliseconds = seconds * 1000;

  int get inMiliSeconds => _miliseconds;

  //note: overloading means giving a special meaning to an operator or method for your own class.
  // Operator >
  bool operator >(CustomDuration other) => _miliseconds > other._miliseconds;

  // Operator +
  CustomDuration operator +(CustomDuration other) =>
      CustomDuration._(_miliseconds + other._miliseconds);

  // Operator -
  CustomDuration operator -(CustomDuration other) {
    int result = _miliseconds - other._miliseconds;
    if (result < 0) result = 0;
    return CustomDuration._(result);
  }
}

void main() {
  final d1 = CustomDuration.fromSeconds(60);
  final d2 = CustomDuration.fromSeconds(45);

  print(d1 > d2); // true
  print((d1 + d2).inMiliSeconds); // 105000
  print((d1 - d2).inMiliSeconds); // 15000
}