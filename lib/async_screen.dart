import 'package:flutter/material.dart';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({super.key});

  @override
  State<AsyncScreen> createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  String _status = 'Press button to load';
  bool _isLoading = false;

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _status = 'Loading...';
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
      _status = 'Data loaded successfully!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Loading')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              _status, 
              style: const TextStyle(fontSize: 18)
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _loadData,
              child: const Text('Load Data'),
            ),
          ],
        ),
      ),
    );
  }
}