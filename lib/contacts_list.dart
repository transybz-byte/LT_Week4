import 'package:flutter/material.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {'name': 'Tran Van Sy', 'phone': '+1234567890'},
      {'name': 'Name 1', 'phone': '+1987654321'},
      {'name': 'Name 2', 'phone': '+1122334455'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts List')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${contact['name']}')),
              );
            },
          );
        },
      ),
    );
  }
}