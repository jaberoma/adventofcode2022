import 'package:advent_of_code_2022/day7.dart';
import 'package:test/test.dart';
import 'testing.dart';

void main() {
  test('puzzle1 with sample file input', () {
    expect(puzzle1(loadFile('day7_input_sample.txt')), 95437);
  });

  test('puzzle1 with file input', () {
    expect(puzzle1(loadFile('day7_input.txt')), 1297683);
  });
}
