import 'package:flutter/material.dart';
import 'package:instagramclon/root_page.dart';

void main() {
  runApp(InstagramClonApp());
}

class InstagramClonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        accentColor: Colors.black
      ),
      home: RootPage(),
    );
  }


}