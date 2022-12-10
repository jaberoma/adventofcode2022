import 'package:advent_of_code_2022/day2_puzzle2.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('puzzle2', () {
    var file = File('test/data/day2_input.txt');
    List<String> strategyGuide = file.readAsLinesSync();

    expect(puzzle2(strategyGuide), 14859);
  });
}
