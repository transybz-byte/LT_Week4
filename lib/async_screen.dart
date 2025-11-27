import 'package:flutter/material.dart';

class AsyncScreen extends StatefulWidget {
  @override
  _AsyncScreenState createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  String _status = 'Tap button to load';

  _loadUser() async {
    setState(() => _status = 'Loading...');
    await Future.delayed(Duration(seconds: 2));
    setState(() => _status = 'User loaded!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Async Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _loadUser, child: Text('Load User')),
          ],
        ),
      ),
    );
  }
}