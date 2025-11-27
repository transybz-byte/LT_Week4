import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class IsolateScreen extends StatefulWidget {
  @override
  _IsolateScreenState createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  String _result = 'Tap to calculate';
  bool _loading = false;

  static String _calculateFactorial(int n) {
    BigInt result = BigInt.one;
    for (int i = 1; i <= n; i++) result *= BigInt.from(i);
    return 'Factorial of $n calculated!';
  }

  _calculate() async {
    setState(() {
      _loading = true;
      _result = 'Calculating...';
    });
    
    final result = await compute(_calculateFactorial, 10000);
    setState(() {
      _result = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Isolate Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            if (_loading) CircularProgressIndicator(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _calculate,
              child: Text('Calculate Factorial'),
            ),
          ],
        ),
      ),
    );
  }
}