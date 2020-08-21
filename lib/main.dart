import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Your app should have a material app widget in order for use other components inside it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.png"), 
                  fit: BoxFit.cover)),
         child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:16.0,right:16.0, top:45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(child: Text(
                'Welcome to,\nRecipe Book',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                decoration: null
              ),)),
              Image(image: AssetImage('images/Logo.png'),)
            ],
          ),
        ),
        // LoginForm()
      ]),
    )));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        _buildEmailField(),
        _buildPasswordField(),
        _buildLoginButton()
      ]),
    );
  }
}

Widget _buildEmailField() {
  return TextFormField(
    decoration: InputDecoration(labelText: "Email"),
  );
}

Widget _buildPasswordField() {
  return TextFormField(decoration: InputDecoration(labelText: "Password"));
}

Widget _buildLoginButton() {
  return RaisedButton(
    onPressed: null,
    child: Text('Login'),
  );
}
