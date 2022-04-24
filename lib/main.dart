import 'package:flutter/material.dart';
import 'package:i9_firebase_crud/views/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC4cxbif1iVLDHYOo9lh6XPdY5DxpGjzYE',
      appId: '1:195914115590:android:766df76ecd1ef122c5b187',
      messagingSenderId: '195914115590',
      projectId: 'i9-firebase-crud',
    ),
  );
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
