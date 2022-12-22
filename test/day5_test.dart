import 'package:advent_of_code_2022/day5.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('parseLineWithMovements', () {
    Move? movement = parseMovement('move 1 from 2 to 1');
    expect(movement, Move(1, 2, 1));
  });

  test('puzzle1', () {
    List<String> peerAssignments = [
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

    expect(puzzle1(peerAssignments), 'CMZ');
  });

  test('puzzle1 with file', () {
    var file = File('test/data/day5_input.txt');
    List<String> crates = file.readAsLinesSync();

    expect(puzzle1(crates), 'CFFHVVHNC');
  });
}
