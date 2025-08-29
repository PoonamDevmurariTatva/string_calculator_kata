# string_calculator_kata

# 🧮 String Calculator Kata (Flutter/Dart)

This project is a **Flutter implementation of the String Calculator Kata**.  
It demonstrates **TDD (Test-Driven Development)** principles and includes both **unit tests** and a **simple Flutter UI**.

---

## 🚀 Features

- Empty string returns `0`
- Comma (`,`) and newline (`\n`) as default delimiters
- Custom single-character delimiter:  
  Example: `//;\n1;2` → `3`
- Multi-character delimiters:  
  Example: `//[***]\n1***2***3` → `6`
- Multiple delimiters:  
  Example: `//[*][%]\n1*2%3` → `6`
- Multiple multi-character delimiters:  
  Example: `//[***][%%]\n1***2%%3` → `6`
- Ignores numbers greater than `1000`
- Throws exception for negative numbers, listing all negatives:
    - Example: `1,-2,-3` → `Exception: negative numbers not allowed -2,-3`

---

## 📂 Project Structure

lib/
├── main.dart # Flutter UI
└── string_calculator.dart # String Calculator logic
test/
└── string_calculator_test.dart # Unit tests (TDD)

Start the Flutter app:
flutter run

Example Inputs in the UI:
"" → Result: 0
"1,2,3" → Result: 6
"1\n2,3" → Result: 6
"//;\n1;2" → Result: 3
"//[***]\n1***2***3" → Result: 6
"//[*][%]\n1*2%3" → Result: 6
"2,1001" → Result: 2
"1,-2,-3" → Error: negative numbers not allowed -2,-3

please find screenshot of the app in below link
https://drive.google.com/file/d/1N8STJm-plNz3SJ2GdxeE1CzjglyoLK3B/view?usp=sharing

Purpose
This project is for practicing TDD in Dart/Flutter.
It follows the classic String Calculator Kata exercise.

Notes
The UI is minimal, just a text field and a result/error display.
Errors are shown in red, results in green.
Layout is scroll-safe (avoids keyboard overflow issues).

## 🧪 Running Tests

Run all tests with:

```bash
flutter test




