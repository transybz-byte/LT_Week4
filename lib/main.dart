import 'package:flutter/material.dart';
import 'contacts_list.dart';
import 'screens/grid_view_screen.dart';
import 'shared_prefs_screen.dart';
import 'screens/async_screen.dart';
import 'screens/isolate_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 4 Lab Exercises',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          children: [
            // ✅ SỬA: Dùng Icons.science thay vì Icons.laboratory
            Icon(Icons.science, color: Colors.white),
            SizedBox(width: 12),
            Text(
              'Week 4 Lab Exercises',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.indigo[700],
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildExerciseCard(
              context,
              '📋 List View',
              'Scrollable contacts list',
              Icons.list,
              Colors.blue[600]!,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsListScreen()),
              ),
            ),
            _buildExerciseCard(
              context,
              '🖼️ Grid View',
              'Fixed & Responsive grids',
              Icons.grid_view,
              Colors.green[600]!,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GridViewScreen()),
              ),
            ),
            _buildExerciseCard(
              context,
              '💾 Shared Prefs',
              'Save & Load user data',
              Icons.save,
              Colors.purple[600]!,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SharedPrefsScreen()),
              ),
            ),
            _buildExerciseCard(
              context,
              '⏳ Async',
              'Loading with delay',
              Icons.hourglass_empty,
              Colors.teal[600]!,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AsyncScreen()),
              ),
            ),
            _buildExerciseCard(
              context,
              '⚡ Isolate',
              'Heavy calculation',
              Icons.speed,
              Colors.orange[600]!,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IsolateScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}