import 'package:advent_of_code_2022/day1.dart';
import 'package:test/test.dart';
import 'testing.dart';

final String _inputFile = 'day1_input.txt';

void main() {
  test('puzzle1', () {
    expect(puzzle1(loadFile(_inputFile)), 69528);
  });

  test('puzzle2', () {
    expect(puzzle2(loadFile(_inputFile)), 206152);
  });
}
