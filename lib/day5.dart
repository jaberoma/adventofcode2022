String puzzle1(List<String> sourceStructure) {
  RearrangmentInstructions instructions =
      RearrangmentInstructions.from(sourceStructure);

  instructions.doPuzzle1Movements();

  return instructions.getOutput();
}

String puzzle2(List<String> sourceStructure) {
  RearrangmentInstructions instructions =
      RearrangmentInstructions.from(sourceStructure);

  instructions.doPuzzle2Movements();

  return instructions.getOutput();
}

class RearrangmentInstructions {
  static final int crateSize = 3;

  final List<Move> _movements = [];
  List<List<String>> _stacksOfCrates = [];

  RearrangmentInstructions.from(List<String> sourceStructure) {
    _stacksOfCrates =
        List.generate(sourceStructure.first.length ~/ crateSize, (index) => []);

    for (var line in sourceStructure) {
      if (line.startsWith('move')) {
        Move? movement = Move.parseMovement(line);
        if (movement != null) {
          _movements.add(movement);
        }
      } else if (line.contains('[')) {
        int stack = 0;
        String remainingLine = line;
        while (remainingLine.length >= crateSize) {
          String crateAttempt = remainingLine.substring(0, crateSize);
          if (crateAttempt.contains('[')) {
            _stacksOfCrates[stack].insert(0, crateAttempt[1]);
          }

          remainingLine = remainingLine.substring(crateSize);
          if (remainingLine.startsWith(' ')) {
            remainingLine = remainingLine.substring(1);
          }
          stack++;
        }
      }
    }
  }

  void doPuzzle1Movements() {
    for (Move movement in _movements) {
      List<String> sourceStack = _stacksOfCrates[movement._from - 1];
      for (int crates = 0; crates < movement._number; crates++) {
        if (sourceStack.isNotEmpty) {
          _stacksOfCrates[movement._to - 1].add(sourceStack.removeLast());
        }
      }
    }
  }

  void doPuzzle2Movements() {
    for (Move movement in _movements) {
      List<String> sourceStack = _stacksOfCrates[movement._from - 1];
      int number = sourceStack.length >= movement._number
          ? movement._number
          : sourceStack.length;

      _stacksOfCrates[movement._to - 1]
          .addAll(sourceStack.skip(sourceStack.length - number).take(number));

      sourceStack.removeRange(sourceStack.length - number, sourceStack.length);
    }
  }

  String getOutput() {
    return _stacksOfCrates
        .map((stack) => stack.isNotEmpty ? stack.removeLast() : '')
        .join();
  }
}

class Move {
  final int _number;
  final int _from;
  final int _to;

  Move(this._number, this._from, this._to);

  static Move? parseMovement(String movementLine) {
    RegExp exp = RegExp(r'\b\d+\b');

    List<int> movements = exp
        .allMatches(movementLine)
        .map((match) => int.parse(match.group(0) ?? ''))
        .toList();
    if (movements.length == 3) {
      return Move(movements.elementAt(0), movements.elementAt(1),
          movements.elementAt(2));
    }
  }

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
