import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/Screens/contact_profile_screen.dart';
import 'package:flutter_contacts/Screens/new_contact_screen.dart';
import 'package:flutter_contacts/components/MyIconButton.dart';
import 'package:flutter_contacts/components/myScaffold.dart';
import 'package:flutter_contacts/components/myTextButton.dart';
import 'package:flutter_contacts/components/myTextField.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import '../components/myText.dart';
import 'package:http/http.dart' as http;

class ContactsScreen extends StatefulWidget {
  ContactsScreen({
    super.key,
  });
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  bool isLoading = true;
  List data = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      noAppBar: true,
      widgets: [
        Visibility(
          visible: isLoading,
          child: RefreshIndicator(
            onRefresh: getData,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyText(
                      text: "Contacts",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    MyIconButton(
                      icon: Icons.add,
                      onPressed: () {
                        Get.to(() => NewContact());
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: MyTextField(
                    hintText: "Search by name",
                    suffixIconColor: Colors.grey,
                    suffixIcon: Icons.search,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 0)),
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: data.isEmpty ? 400 : 700,
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: ((context, index) {
                        final item = data[index] as Map;
                        final id = item["id"] as String;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Get.to(() => ContactProfile());
                            },
                            trailing: PopupMenuButton(
                              onSelected: (value) {
                                if (value == 'edit') {
                                } else if (value == 'delete') {
                                  deleteById(id);
                                }
                              },
                              itemBuilder: ((context) {
                                return [
                                  /*   const PopupMenuItem(
                                    value: 'edit',
                                    child: Text("Edit"),
                                  ), */
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text("Delete"),
                                  ),
                                ];
                              }),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            tileColor: Colors.white,
                            title: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        MyText(
                                          text: item["firstName"],
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        MyText(
                                          text: item["lastName"],
                                        ),
                                      ],
                                    ),
                                    MyText(
                                        text: item['phoneNumber'],
                                        color: Colors.grey),
                                  ],
                                ),
                              ],
                            ),
                            leading: const Icon(Icons.person),
                          ),
                        );
                      })),
                ),
                Visibility(
                  visible: data.isEmpty,
                  child: Column(
                    children: [
                      const Icon(Icons.person, size: 80),
                      const Text(
                        "No Contacts",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const Text("Contacts you've added will appear here."),
                      MyTextButton(
                        text: "Create New Contact",
                        onPressed: () {
                          Get.to(() => NewContact());
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> deleteById(String id) async {
    final url = 'http://146.59.52.68:11235/api/User/$id';
    final uri = Uri.parse(url);

    final response = await http.delete(
      uri,
      headers: {
        "ApiKey": 'e5076ea6-afe1-470f-b549-775974211f9a',
        'Content-Type': 'text/plain',
      },
    );
    if (response.statusCode == 200) {
      final notDeletedOnes =
          data.where((element) => element['id'] != id).toList();
      setState(() {
        data = notDeletedOnes;
      });
      print("Id çekildi");
      print(id);
    } else
      print("error");
    print(id);
  }

  Future<void> getData() async {
    const url = "http://146.59.52.68:11235/api/User?skip=0&take=100";
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {
        "ApiKey": 'e5076ea6-afe1-470f-b549-775974211f9a',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final results = (json['data']['users']) as List;

      setState(() {
        data = results;
      });
    }
    setState(() {
      isLoading = true;
    });
  }
}
