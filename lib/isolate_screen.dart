import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:isolate';

class IsolateScreen extends StatefulWidget {
  @override
  _IsolateScreenState createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  int _factorialResult = 0;
  bool _isCalculating = false;
  final TextEditingController _numberController = TextEditingController();

  // Function to calculate factorial in isolate
  static BigInt _calculateFactorial(int n) {
    BigInt result = BigInt.one;
    for (int i = 2; i <= n; i++) {
      result *= BigInt.from(i);
    }
    return result;
  }

  Future<void> _calculateFactorialInIsolate() async {
    final input = int.tryParse(_numberController.text);
    if (input == null || input <= 0 || input > 10000) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a number between 1 and 10000')),
      );
      return;
    }

    setState(() => _isCalculating = true);

    try {
      final result = await compute(_calculateFactorialInIsolateFunction, input);
      if (mounted) {
        setState(() {
          _factorialResult = input;
          _isCalculating = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Factorial of $input! = $result'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isCalculating = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error calculating factorial: $e')),
        );
      }
    }
  }

  // This function runs in isolate
  static BigInt _calculateFactorialInIsolateFunction(int n) {
    return _calculateFactorial(n);
  }

  String _formatNumber(dynamic number) {
    if (number is BigInt) {
      return number.toString();
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Isolate - Factorial Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.calculate,
                      size: 64,
                      color: Colors.deepOrange[400],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Heavy Factorial Calculation',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This uses Isolate (compute) to prevent UI freezing',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter number (1-10000)',
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        suffixIcon: _isCalculating
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : null,
                      ),
                      enabled: !_isCalculating,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: _isCalculating ? null : _calculateFactorialInIsolate,
                        icon: _isCalculating
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : Icon(Icons.play_arrow),
                        label: Text(_isCalculating ? 'Calculating...' : 'Calculate Factorial'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange[600],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            if (_factorialResult > 0) ...[
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Result',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Completed ✅',
                              style: TextStyle(
                                color: Colors.green[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$_factorialResult!',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange[700],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Factorial of $_factorialResult',
                              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.orange[700]),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Try calculating factorial of 5000+ to see the UI staying responsive!',
                      style: TextStyle(fontSize: 14, color: Colors.orange[700]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}