import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SharedPrefsScreen extends StatefulWidget {
  const SharedPrefsScreen({super.key});

  @override
  State<SharedPrefsScreen> createState() => _SharedPrefsScreenState();
}

class _SharedPrefsScreenState extends State<SharedPrefsScreen> {
  final _nameController = TextEditingController();
  String _savedName = 'No data';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/user_data.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        final data = jsonDecode(contents);
        setState(() {
          _savedName = data['name'] ?? 'No data';
          _nameController.text = data['name'] ?? '';
        });
      }
    } catch (e) {
      setState(() => _savedName = 'Error loading');
    }
  }

  Future<void> _saveData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/user_data.json');
      final data = {'name': _nameController.text, 'timestamp': DateTime.now().toIso8601String()};
      await file.writeAsString(jsonEncode(data));
      
      setState(() => _savedName = _nameController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('Save'),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Saved: $_savedName'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}