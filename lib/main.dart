import 'package:flutter/material.dart';
import 'package:recipebook/screens/home_screen.dart';
import 'package:recipebook/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'ApercuPro',
          ),
        ),
      ),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
