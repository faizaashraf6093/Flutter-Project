import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts",
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Contacts")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < 20; i++)
                const ListTile(
                  leading: Icon(Icons.phone_callback),
                  title: Text('Faiza Ashraf'),
                  subtitle: Text('0305 4379955'),
                  trailing: Icon(Icons.info_outline_rounded),
                ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.dialpad),
        ),
      ),
    );
  }
}
