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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Welcome to\n',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        TextSpan(
                          text: 'Recipe Book',
                          style: TextStyle(
                            fontSize: 36.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Logo.png'),
                ],
              ),
              CustomTextFormField(
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                placeholder: 'Password',
                obscureText: true,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Color(0xff34A853),
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.padding,
    this.placeholder,
    this.contentPadding,
    this.keyboardType,
    this.obscureText,
    this.focusNode,
    this.autoFocus,
  });

  final EdgeInsets padding;
  final String placeholder;
  final EdgeInsets contentPadding;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode focusNode;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          labelText: this.placeholder ?? '',
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          fillColor: Colors.white30,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: this.contentPadding ?? EdgeInsets.all(16.0),
        ),
        focusNode: this.focusNode,
        keyboardType: this.keyboardType,
        obscureText: this.obscureText ?? false,
      ),
    );
  }
}
