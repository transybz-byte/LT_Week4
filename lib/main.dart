import 'package:flutter/material.dart';
import 'contacts_list.dart';
import 'grid_view_screen.dart';
import 'shared_prefs_screen.dart';
import 'async_screen.dart';
import 'isolate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 4 Lab',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 4 Exercises'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildButton(
            'Contacts List',
            Icons.list,
            Colors.blue,
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactsListScreen())),
          ),
          _buildButton(
            'Grid View',
            Icons.grid_view,
            Colors.green,
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GridViewScreen())),
          ),
          _buildButton(
            'Local Storage',
            Icons.save,
            Colors.purple,
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SharedPrefsScreen())),
          ),
          _buildButton(
            'Async Loading',
            Icons.hourglass_empty,
            Colors.orange,
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AsyncScreen())),
          ),
          _buildButton(
            'Isolate Calc',
            Icons.calculate,
            Colors.red,
            () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IsolateScreen())),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 24),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}