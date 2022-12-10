import 'package:advent_of_code_2022/day1.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('puzzle1', () {
    var file = File('test/data/day1_input.txt');
    List<String> elvesCalories = file.readAsLinesSync();

    expect(puzzle1(elvesCalories), 69528);
  });

  test('puzzle2', () {
    var file = File('test/data/day1_input.txt');
    List<String> elvesCalories = file.readAsLinesSync();

    expect(puzzle2(elvesCalories), 206152);
  });
}
