import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/views/home_page.dart';
import 'package:i9_firebase_crud/views/register_person_page.dart';
import 'package:i9_firebase_crud/views/view_person_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
