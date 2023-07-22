import 'package:flutter/material.dart';
import 'widget/bottom_navigation.dart';

void main() => runApp(
      MaterialApp(
        title: 'Circular Bottom Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Directionality(
          textDirection: TextDirection.ltr,
          child: BottomNavigation(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
