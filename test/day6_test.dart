import 'package:advent_of_code_2022/day6.dart';
import 'package:test/test.dart';
import 'testing.dart';

final String _inputFile = 'day6_input.txt';

void main() {
  test('puzzle1', () {
    Map<String, int> buffersAndPosition = {
      'mjqjpqmgbljsphdztnvjfqwrcgsmlb': 7,
      'bvwbjplbgvbhsrlpgdmjqwftvncz': 5,
      'nppdvjthqldpwncqszvftbrmjlhg': 6,
      'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg': 10,
      'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw': 11
    };

    buffersAndPosition.forEach((key, value) {
      expect(puzzles(key, 4), value);
    });
  });

  test('puzzle1 with file input', () {
    expect(puzzles(loadFile(_inputFile).first, 4), 1848);
  });

  test('puzzle2', () {
    Map<String, int> buffersAndPosition = {
      'mjqjpqmgbljsphdztnvjfqwrcgsmlb': 19,
      'bvwbjplbgvbhsrlpgdmjqwftvncz': 23,
      'nppdvjthqldpwncqszvftbrmjlhg': 23,
      'nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg': 29,
      'zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw': 26
    };

    buffersAndPosition.forEach((key, value) {
      expect(puzzles(key, 14), value);
    });
  });

  test('puzzle2 with file input', () {
    expect(puzzles(loadFile(_inputFile).first, 14), 2308);
  });
}
