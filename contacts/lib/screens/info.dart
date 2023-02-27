import 'package:contacts/functions/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/contact_list.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(contacts[index].name),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    switchTheme(context);
                  });
                },
                icon: const Icon(Icons.light_mode_outlined))
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 300,
            width: double.infinity,
            child: Icon(
              Icons.person,
              size: 200.0,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.sim_card),
              title: Text(contacts[index].phone),
              trailing: Row(
                
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.mail),
              title: Text(contacts[index].email),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [Icon(Icons.edit), Icon(Icons.delete)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
