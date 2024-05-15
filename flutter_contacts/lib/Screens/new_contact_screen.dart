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

class NewContact extends StatefulWidget {
  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
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
              onPressed: () {
                postData();
                Get.to(ContactsScreen());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        const Icon(Icons.person, size: 80),
        MyTextButton(
          text: "Add Photo",
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

  Future<void> postData() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final phoneNumber = phoneNumberController.text;
    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "profileImageUrl": phoneNumber,
    };
    const url = "http://146.59.52.68:11235/api/User/";
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        "ApiKey": 'e5076ea6-afe1-470f-b549-775974211f9a'
      },
    );
    if (response.statusCode == 200) {
      firstNameController.text = "";
      lastNameController.text = "";
      phoneNumberController.text = "";

      print("New contact added successfully");
      print(response.body);
    } else {
      print("New contact not added");
    }
  }
}
