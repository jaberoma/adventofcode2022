import 'package:advent_of_code_2022/day4.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('puzzle1', () {
    List<String> peerAssignments = [
      '2-4,6-8',
      '2-3,4-5',
      '5-7,7-9',
      '2-8,3-7',
      '6-6,4-6',
      '2-6,4-8',
    ];

    expect(puzzle1(peerAssignments), 2);
  });

  test('puzzle1', () {
    var file = File('test/data/day4_input.txt');
    List<String> peerAssigments = file.readAsLinesSync();

    expect(puzzle1(peerAssigments), 511);
  });

  test('puzzle2', () {
    List<String> peerAssignments = [
      '2-4,6-8',
      '2-3,4-5',
      '5-7,7-9',
      '2-8,3-7',
      '6-6,4-6',
      '2-6,4-8',
    ];

    expect(puzzle2(peerAssignments), 4);
  });

  test('puzzle2', () {
    var file = File('test/data/day4_input.txt');
    List<String> peerAssigments = file.readAsLinesSync();

    expect(puzzle2(peerAssigments), 821);
  });
}
