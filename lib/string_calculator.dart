/// A String Calculator Kata implementation in Dart.
///
/// Supports:
/// - Empty string returns 0
/// - Comma and newline as delimiters
/// - Custom delimiters with `//;\n1;2`
/// - Multi-character delimiters like `//[***]\n1***2***3`
/// - Multiple delimiters like `//[*][%]\n1*2%3`
/// - Ignores numbers > 1000
/// - Throws exception for negatives, listing all of them
///
/// Adds numbers represented in [numbers] string.
///
/// Example inputs:
/// - `"1,2,3"` → 6
/// - `"1\n2,3"` → 6
/// - `"//;\n1;2"` → 3
/// - `"//[***]\n1***2***3"` → 6
/// - `"//[*][%]\n1*2%3"` → 6
///
/// Throws:
/// - [Exception] if negative numbers are found.
class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    // Default delimiters are comma and newline
    List<String> delimiters = [",", "\n"];

    // Check if custom delimiter(s) are defined at the start
    if (numbers.startsWith("//")) {
      var split = numbers.split("\n");
      var delimiterLine = split[0].substring(2);
      numbers = split.sublist(1).join("\n");

      // Regex to capture multi-character or multiple delimiters like //[***][%]
      final delimiterRegex = RegExp(r"\[(.*?)\]");
      final matches = delimiterRegex.allMatches(delimiterLine);

      if (matches.isNotEmpty) {
        delimiters = matches.map((m) => m.group(1)!).toList();
      } else {
        delimiters = [delimiterLine];
      }
    }

    // Split numbers using all delimiters
    var regex = RegExp(delimiters.map(RegExp.escape).join("|"));
    var tokens = numbers.split(regex);

    // Parse numbers and ignore values > 1000
    var ints = tokens.map(int.parse).where((n) => n <= 1000).toList();

    // Detect negatives and throw if any found
    var negatives = ints.where((x) => x < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(",")}");
    }

    // Return sum (0 if no valid numbers)
    return ints.isEmpty ? 0 : ints.reduce((a, b) => a + b);
  }
}
