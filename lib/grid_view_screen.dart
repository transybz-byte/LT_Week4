import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(12, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('Grid View')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Fixed Grid (3 columns)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
            children: List.generate(12, (index) => _buildItem(index, items[index])),
          ),
          const SizedBox(height: 24),
          const Text(
            'Responsive Grid',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GridView.extent(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            maxCrossAxisExtent: 150,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
            children: List.generate(12, (index) => _buildItem(index, items[index])),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index, String label) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}