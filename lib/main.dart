import 'package:flutter/material.dart';
import 'package:my_app/Pages/dark.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dark(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: NetworkApi(
    //     posts: ApiCall().fetchPosts(),
    //   ),
    // );
  }
}
