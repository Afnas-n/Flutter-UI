import 'package:flutter/material.dart';
import 'package:my_app/Pages/api_call.dart';
import 'package:my_app/Pages/network_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NetworkApi(
        posts: ApiCall().fetchPosts(),
      ),
    );
  }
}
