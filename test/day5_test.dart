import 'package:advent_of_code_2022/day5.dart';
import 'package:test/test.dart';
import 'testing.dart';

final String _inputFile = 'day5_input.txt';

void main() {
  test('parseLineWithMovements', () {
    Move? movement = Move.parseMovement('move 1 from 2 to 1');
    expect(movement, Move(1, 2, 1));
  });

  test('puzzle1', () {
    List<String> crates = [
      '    [D]    ',
      '[N] [C]    ',
      '[Z] [M] [P]',
      '1   2   3 ',
      '',
      'move 1 from 2 to 1',
      'move 3 from 1 to 3',
      'move 2 from 2 to 1',
      'move 1 from 1 to 2',
    ];

    expect(puzzle1(crates), 'CMZ');
  });

  test('puzzle1 with file', () {
    expect(puzzle1(loadFile(_inputFile)), 'CFFHVVHNC');
  });

  test('puzzle2', () {
    List<String> crates = [
      '    [D]    ',
      '[N] [C]    ',
      '[Z] [M] [P]',
      '1   2   3 ',
      '',
      'move 1 from 2 to 1',
      'move 3 from 1 to 3',
      'move 2 from 2 to 1',
      'move 1 from 1 to 2',
    ];

    expect(puzzle2(crates), 'MCD');
  });

  test('puzzle2 with file', () {
    expect(puzzle2(loadFile(_inputFile)), 'FSZWBPTBG');
  });
}
