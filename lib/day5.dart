final int crateSize = 3;

String puzzle1(List<String> sourceStructure) {
  List<Move> movements = [];
  List<List<String>> stacksOfCrates =
      List.generate(sourceStructure.first.length ~/ crateSize, (index) => []);

  for (var line in sourceStructure) {
    if (line.startsWith('move')) {
      Move? movement = parseMovement(line);
      if (movement != null) {
        movements.add(movement);
      }
    } else if (line.contains('[')) {
      int stack = 0;
      String remainingLine = line;
      while (remainingLine.length >= crateSize) {
        String crateAttempt = remainingLine.substring(0, crateSize);
        if (crateAttempt.contains('[')) {
          stacksOfCrates[stack].insert(0, crateAttempt[1]);
        }

        remainingLine = remainingLine.substring(crateSize);
        if (remainingLine.startsWith(' ')) {
          remainingLine = remainingLine.substring(1);
        }
        stack++;
      }
    }
  }

  print(movements);
  print(stacksOfCrates);

  for (Move movement in movements) {
    for (int crates = 0; crates < movement._number; crates++) {
      if (stacksOfCrates[movement._from - 1].isNotEmpty) {
        stacksOfCrates[movement._to - 1]
            .add(stacksOfCrates[movement._from - 1].removeLast());
      }
    }
  }

  return stacksOfCrates
      .map((stack) => stack.isNotEmpty ? stack.removeLast() : '')
      .join();
}

Move? parseMovement(String movementLine) {
  RegExp exp = RegExp(r'\b\d+\b');

  List<int> movements = exp
      .allMatches(movementLine)
      .map((match) => int.parse(match.group(0) ?? ''))
      .toList();
  if (movements.length == 3) {
    return Move(
        movements.elementAt(0), movements.elementAt(1), movements.elementAt(2));
  }
}

class Move {
  final int _number;
  final int _from;
  final int _to;

  Move(this._number, this._from, this._to);

  @override
  bool operator ==(Object other) {
    if (other is Move) {
      return _number == other._number &&
          _from == other._from &&
          _to == other._to;
    }
    return false;
  }

  @override
  int get hashCode => _number.hashCode ^ _from.hashCode ^ _to.hashCode;
}
