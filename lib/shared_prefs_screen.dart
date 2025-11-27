import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsScreen extends StatefulWidget {
  @override
  _SharedPrefsScreenState createState() => _SharedPrefsScreenState();
}

class _SharedPrefsScreenState extends State<SharedPrefsScreen> {
  final _nameController = TextEditingController();
  String _savedName = '';

  _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved!')));
  }

  _showName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('name') ?? 'No name saved';
    });
  }

  _clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    setState(() => _savedName = '');
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _saveName, child: Text('Save')),
                ElevatedButton(onPressed: _showName, child: Text('Show')),
                ElevatedButton(onPressed: _clearName, child: Text('Clear')),
              ],
            ),
            SizedBox(height: 20),
            Text(_savedName, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}