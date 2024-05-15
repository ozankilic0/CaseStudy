import 'package:flutter/material.dart';
import 'package:flutter_contacts/Screens/contacts_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactsScreen(),
    );
  }
}
