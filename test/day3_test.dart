import 'package:advent_of_code_2022/day3.dart';
import 'package:test/test.dart';
import 'testing.dart';

final String _inputFile = 'day3_input.txt';

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
    expect(puzzle1(loadFile(_inputFile)), 8493);
  });

  test('puzzle2', () {
    var rucksacksContents = [
      'vJrwpWtwJgWrhcsFMMfFFhFp',
      'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
      'PmmdzqPrVvPwwTWBwg',
      'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
      'ttgJtRGJQctTZtZT',
      'CrZsJsPPZsGzwwsLwLmpwMDw'
    ];

    expect(puzzle2(rucksacksContents), 70);
  });

  test('puzzle2', () {
    expect(puzzle2(loadFile(_inputFile)), 2552);
  });
}
