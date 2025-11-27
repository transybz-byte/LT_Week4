import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Fixed Column Grid', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(6, (i) => _buildGridItem(i, Colors.blue[100]!)),
            ),
            
            SizedBox(height: 20),
            Text('Responsive Grid', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            GridView.extent(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(6, (i) => _buildGridItem(i + 6, Colors.green[100]!)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index, Color color) {
    return Container(
      color: color, // Sử dụng trực tiếp
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image),
          Text('Item ${index + 1}'),
        ],
      ),
    );
  }
}