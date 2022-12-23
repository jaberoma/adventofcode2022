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
      expect(puzzle1(key), value);
    });
  });

  test('puzzle1 my version', () {
    expect(puzzle1(loadFile(_inputFile).first), 1848);
  });
}
