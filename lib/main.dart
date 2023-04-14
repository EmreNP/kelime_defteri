import 'package:flutter/material.dart';
import 'package:kelime_defteri/screens/word_list.dart';
import 'package:kelime_defteri/screens/navigation_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        body: Center(
            child: WordListPage()),
        bottomNavigationBar: NavigationBarPage(),
      ),
    );
  }
}

