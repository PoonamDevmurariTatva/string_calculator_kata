import 'package:flutter/material.dart';
import 'string_calculator.dart';

void main() {
  runApp(const StringCalculatorApp());
}

/// Root widget of the app
class StringCalculatorApp extends StatelessWidget {
  const StringCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator Kata',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorScreen(),
    );
  }
}

/// UI screen for entering a numbers string and seeing the result
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _controller = TextEditingController();
  final _calc = StringCalculator();
  String _result = "";
  bool _hasError = false;

  /// Attempts calculation and updates [_result] or error message
  void _calculate() {
    setState(() {
      try {
        final input = _controller.text.trim();
        final value = _calc.add(input);
        _result = "Result: $value";
        _hasError = false;
      } catch (e) {
        _result = "Error: ${e.toString()}";
        _hasError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Avoid overflow when keyboard appears
      appBar: AppBar(title: const Text("String Calculator Kata")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter numbers string:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Input field
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g. 1,2,3 or //;\n1;2',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),

              // Calculate button
              Center(
                child: ElevatedButton(
                  onPressed: _calculate,
                  child: const Text("Calculate"),
                ),
              ),
              const SizedBox(height: 20),

              // Result / Error display
              Text(
                _result,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _hasError ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
