import 'package:advent_of_code_2022/day3.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  test('puzzle1', () {
    List<String> rucksacksContents = [
      'vJrwpWtwJgWrhcsFMMfFFhFp',
      'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
      'PmmdzqPrVvPwwTWBwg',
      'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
      'ttgJtRGJQctTZtZT',
      'CrZsJsPPZsGzwwsLwLmpwMDw'
    ];

    expect(puzzle1(rucksacksContents), 157);
  });

  test('puzzle1', () {
    var file = File('test/data/day3_input.txt');
    List<String> rucksacksContents = file.readAsLinesSync();

    expect(puzzle1(rucksacksContents), 8493);
  });
}
