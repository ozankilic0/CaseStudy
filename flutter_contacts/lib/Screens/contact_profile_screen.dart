import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/Screens/contacts_screen.dart';
import 'package:flutter_contacts/components/myScaffold.dart';
import 'package:flutter_contacts/components/myText.dart';
import 'package:flutter_contacts/components/myTextButton.dart';
import 'package:flutter_contacts/components/myTextField.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class ContactProfile extends StatefulWidget {
  @override
  State<ContactProfile> createState() => _ContactProfileState();
}

class _ContactProfileState extends State<ContactProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      noAppBar: true,
      widgets: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextButton(
              text: "Cancel",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const MyText(
              text: "New Contacts",
              fontSize: 18,
            ),
            MyTextButton(
              text: "Done",
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        const Icon(Icons.person, size: 80),
        MyTextButton(
          text: "Change Photo",
          onPressed: () {},
        ),
        MyTextField(
          teController: firstNameController,
          hintText: "First Name",
          suffixIconColor: Colors.grey,
          suffixIcon: Icons.person_outline_rounded,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0.8)),
          onTap: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        MyTextField(
          teController: lastNameController,
          hintText: "Last Name",
          suffixIconColor: Colors.grey,
          suffixIcon: Icons.person_outline_rounded,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0.8)),
          onTap: () {},
        ),
        const SizedBox(
          height: 20,
        ),
        MyTextField(
          teController: phoneNumberController,
          hintText: "Phone Number",
          suffixIconColor: Colors.grey,
          suffixIcon: Icons.phone,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0.8)),
          onTap: () {},
        ),
      ],
    );
  }
}
