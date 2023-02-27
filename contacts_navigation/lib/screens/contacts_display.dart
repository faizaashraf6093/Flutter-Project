import 'package:contacts_navigation/contact_list.dart';
import 'package:contacts_navigation/screens/contacts_info.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contacts_navigation/functions/functions';

class ContactsDisplay extends StatefulWidget {
  const ContactsDisplay({super.key});

  @override
  State<ContactsDisplay> createState() => _ContactsDisplayState();
}

class _ContactsDisplayState extends State<ContactsDisplay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Saved Contacts'),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(contacts[index].name[0]),
                ),
                title: Text(contacts[index].name),
                subtitle: Text(contacts[index].phone.toString()),
                trailing: Row(
                  children: [
                    // Info button
                    IconButton(
                        icon: const Icon(Icons.info_outline_rounded),
                        onPressed: () => Get.to(
                            Info(contacts[index].name, contacts[index].phone))),

                    // Call Button
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Calling ${contacts[index].name}...'),
                              duration: const Duration(seconds: 5),
                            ),
                          );
                        },
                        icon: const Icon(Icons.call)),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
