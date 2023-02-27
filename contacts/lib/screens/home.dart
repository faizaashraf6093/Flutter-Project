import 'package:contacts/data/contact_list.dart';
import 'package:contacts/screens/info.dart';
import 'package:flutter/material.dart';
import 'package:contacts/functions/theme.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                switchTheme(context);
              });
            },
            icon: const Icon(Icons.light_mode_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(contacts[index].name[0]),
            ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phone),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // call button
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Calling ${contacts[index].name}...'),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
                    icon: const Icon(Icons.call)),
                // info button
                IconButton(
                    onPressed: () {
                      Get.to(
                        const Info(),
                        arguments: index,
                      );
                    },
                    icon: const Icon(Icons.info_outline_rounded)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
