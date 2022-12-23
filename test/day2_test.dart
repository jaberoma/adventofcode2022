import 'package:advent_of_code_2022/day2_puzzle1.dart';
import 'package:advent_of_code_2022/day2_puzzle2.dart';
import 'package:test/test.dart';
import 'testing.dart';

final String _inputFile = 'day2_input.txt';

void main() {
  test('puzzle1', () {
    expect(puzzle1(loadFile(_inputFile)), 10310);
  });

  test('puzzle2', () {
    expect(puzzle2(loadFile(_inputFile)), 14859);
  });
}
