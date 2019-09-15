import 'package:flutter/material.dart';
import 'package:u_manager_flutter/Screen/Home_Page/home_page.dart';
import 'package:u_manager_flutter/Screen/search_page/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'U-manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}

