import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'loginpage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forms in Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
