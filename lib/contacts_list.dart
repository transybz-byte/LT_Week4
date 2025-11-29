import 'package:flutter/material.dart';

class ContactsListScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'John Doe', 'phone': '+1234567890'},
    {'name': 'Jane Smith', 'phone': '+1987654321'},
    {'name': 'Mike Johnson', 'phone': '+1122334455'},
    {'name': 'Sarah Wilson', 'phone': '+1555666777'},
    {'name': 'David Brown', 'phone': '+1444555666'},
    {'name': 'Lisa Davis', 'phone': '+1333444555'},
    {'name': 'Tom Anderson', 'phone': '+1222333444'},
    {'name': 'Emma Taylor', 'phone': '+1111222233'},
    {'name': 'Chris Miller', 'phone': '+1999888777'},
    {'name': 'Anna White', 'phone': '+1777666555'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Contacts List', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue[400],
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
              title: Text(
                contact['name']!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  contact['phone']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected: ${contact['name']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}