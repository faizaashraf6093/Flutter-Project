import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/contacts_display.dart';
import 'Screens/contacts_info.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contacts',
      initialRoute: '/',

      getPages: [
        GetPage(name: '/', page : () => const ContactsDisplay(),),
        GetPage(name: '/info', page: () => const Info(),)


      ],

      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark
        ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
      ),
    );
  }
}
