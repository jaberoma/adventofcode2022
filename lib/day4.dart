import 'dart:math';

int puzzle1(List<String> assignments) {
  return assignments.where((element) {
    List<String> pairs = element.split(',');
    Assignment first = Assignment.from(pairs.first);
    Assignment second = Assignment.from(pairs.last);
    return first.isContainedIn(second) || second.isContainedIn(first);
  }).length;
}

int puzzle2(List<String> assignments) {
  return assignments.where((element) {
    List<String> pairs = element.split(',');
    Assignment first = Assignment.from(pairs.first);
    Assignment second = Assignment.from(pairs.last);
    return first.overlap(second);
  }).length;
}

class Assignment {
  int _lowerBound;
  int _upperBound;

  Assignment(this._lowerBound, this._upperBound);

  factory Assignment.from(String peerAssigment) {
    List<String> parts = peerAssigment.split('-');
    return Assignment(int.parse(parts[0]), int.parse(parts[1]));
  }

  bool isContainedIn(Assignment assignment) {
    return assignment._lowerBound <= _lowerBound &&
        assignment._upperBound >= _upperBound;
  }

  bool overlap(Assignment assignment) {
    return max(_lowerBound, assignment._lowerBound) <=
        min(_upperBound, assignment._upperBound);
  }
}
