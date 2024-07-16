import 'package:flutter/material.dart';
import 'package:my_app/Pages/signin_page.dart';
import 'package:my_app/Pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      
    );
  }
}
