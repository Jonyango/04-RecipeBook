import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 22.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Welcome to',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        'Recipe book',
                        style: TextStyle(fontSize: 36.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
