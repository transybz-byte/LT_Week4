import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  final List<String> items = List.generate(12, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Grid View Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: GridView.count
            Text(
              'Fixed Column Grid',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple[700]),
            ),
            SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              children: List.generate(12, (index) => _buildGridItem(index, items[index])),
            ),
            SizedBox(height: 32),

            // Section 2: GridView.extent
            Text(
              'Responsive Grid',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange[700]),
            ),
            SizedBox(height: 16),
            GridView.extent(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: List.generate(12, (index) => _buildGridItem(index, items[index])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index, String label) {
    final icons = [
      Icons.star, Icons.favorite, Icons.home, Icons.settings,
      Icons.camera, Icons.music_note, Icons.book, Icons.phone,
      Icons.email, Icons.map, Icons.notifications, Icons.person
    ];
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons[index % icons.length], color: Colors.white, size: 40),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}