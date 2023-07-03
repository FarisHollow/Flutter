import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}

class ContactApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'johndoe@example.com',
      phoneNumber: '123-456-7890',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      phoneNumber: '987-654-3210',
    ),
    Contact(
      name: 'Bob Johnson',
      email: 'bobjohnson@example.com',
      phoneNumber: '555-555-5555',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact List'),
          centerTitle: true,

        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index].name),

              onTap: () {
                _showContactDetails(context, contacts[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height:8.0),
              Text(
                'Name: ${contact.name}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 8.0),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }
}
