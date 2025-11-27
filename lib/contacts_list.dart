import 'package:flutter/material.dart';

class ContactsListScreen extends StatelessWidget {
  final contacts = List.generate(12, (i) => 'Contact ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, i) => ListTile(
          leading: CircleAvatar(child: Text(contacts[i][0])),
          title: Text(contacts[i]),
        ),
      ),
    );
  }
}