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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Exercises')),
      body: ListView(
        children: [
          ListTile(
            title: Text('1. Contacts List'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ContactsListScreen())),
          ),
          ListTile(
            title: Text('2. Grid View Examples'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => GridViewScreen())),
          ),
          ListTile(
            title: Text('3. Shared Preferences'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SharedPrefsScreen())),
          ),
          ListTile(
            title: Text('4. Async Programming'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AsyncScreen())),
          ),
          ListTile(
            title: Text('5. Isolate Examples'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => IsolateScreen())),
          ),
        ],
      ),
    );
  }
}