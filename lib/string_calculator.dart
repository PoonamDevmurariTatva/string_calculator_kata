class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> delimiters = [",", "\n"];

    if (numbers.startsWith("//")) {
      var split = numbers.split("\n");
      var delimiterLine = split[0].substring(2);
      numbers = split.sublist(1).join("\n");

      // Multi-character + multiple delimiters
      final delimiterRegex = RegExp(r"\[(.*?)\]");
      final matches = delimiterRegex.allMatches(delimiterLine);

      if (matches.isNotEmpty) {
        delimiters = matches.map((m) => m.group(1)!).toList();
      } else {
        delimiters = [delimiterLine];
      }
    }

    // Build regex for all delimiters
    var regex = RegExp(delimiters.map(RegExp.escape).join("|"));
    var tokens = numbers.split(regex);

    var ints = tokens.map(int.parse).where((n) => n <= 1000).toList();

    var negatives = ints.where((x) => x < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception("negative numbers not allowed ${negatives.join(",")}");
    }

    return ints.isEmpty ? 0 : ints.reduce((a, b) => a + b);
  }
}
