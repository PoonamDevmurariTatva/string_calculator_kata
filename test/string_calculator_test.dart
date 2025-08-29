import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_kata/string_calculator.dart';

void main() {
  late StringCalculator calc;

  setUp(() {
    calc = StringCalculator();
  });

  test('Empty string returns 0', () {
    expect(calc.add(""), 0);
  });

  test('Single number returns itself', () {
    expect(calc.add("1"), 1);
  });

  test('Two numbers comma separated', () {
    expect(calc.add("1,5"), 6);
  });

  test('Multiple numbers return sum', () {
    expect(calc.add("1,2,3,4"), 10);
  });

  test('Handles new line as separator', () {
    expect(calc.add("1\n2,3"), 6);
  });

  test('Supports custom delimiter', () {
    expect(calc.add("//;\n1;2"), 3);
  });

  test('Negative numbers throw exception with all negatives listed', () {
    expect(
          () => calc.add("1,-2,-3,4"),
      throwsA(predicate((e) =>
      e is Exception &&
          e.toString().contains("negative numbers not allowed -2,-3"))),
    );
  });

  test('Ignores numbers greater than 1000', () {
    expect(calc.add("2,1001"), 2);
  });

  test('Supports multi-character delimiter', () {
    expect(calc.add("//[***]\n1***2***3"), 6);
  });

  test('Supports multiple delimiters', () {
    expect(calc.add("//[*][%]\n1*2%3"), 6);
  });

  test('Supports multiple multi-character delimiters', () {
    expect(calc.add("//[***][%%]\n1***2%%3"), 6);
  });
}
