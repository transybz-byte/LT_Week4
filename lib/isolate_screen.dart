import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  String _result = '';
  bool _isCalculating = false;
  final _numberController = TextEditingController();

  Future<void> _calculate() async {
    final n = int.tryParse(_numberController.text);
    if (n == null || n <= 0 || n > 1000) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter number 1-1000')),
      );
      return;
    }

    setState(() {
      _isCalculating = true;
      _result = 'Calculating $n!...';
    });

    try {
      final factorial = await compute(_factorial, n);
      setState(() {
        _result = '$n! = $factorial';
        _isCalculating = false;
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
        _isCalculating = false;
      });
    }
  }

  static int _factorial(int n) {
    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter number (1-1000)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isCalculating ? null : _calculate,
              child: const Text('Calculate Factorial'),
            ),
            const SizedBox(height: 16),
            if (_isCalculating) const CircularProgressIndicator(),
            const SizedBox(height: 16),
            if (_result.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _result, 
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}