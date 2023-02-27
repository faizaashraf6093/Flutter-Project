import 'package:contacts_navigation/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Info extends StatefulWidget {
  const Info(String name, int phone, String email, {super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {  
  
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(contacts[index].name),
)
        )
        ),
    );
  }
}
