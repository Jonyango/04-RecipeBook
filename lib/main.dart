import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//The trailing commas are important as they help you format your code
// Your app should have a material app widget in order for use other components inside it.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover,),
              ),
              child: Column(children: <Widget>[
                Padding(
                  padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
          Expanded(
            child: Text(
              'Welcome to,\nRecipe Book',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  
                  ),
            ),
          ),
          Image(
            image: AssetImage('images/Logo.png'),
          ),
                    ],
                  ),
                ),
                Center(
                  child: LoginForm(),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical:16.0),
                  child: Text(
                    'Login With',
                    style: TextStyle(
                      color:Colors.white
                    ),
                  ),
                ),
                _socialButtons(),
                SizedBox(
                  height:70,
                  ),
                _createAccountButton(),

              ],),
            ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final focusPassword = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildEmailField,
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildPasswordField,
        ),
        _buildForgetPasswordButton(),
        _buildLoginButton()
      ]),
    );
  }

  Widget get _buildEmailField {
    String regex =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    return TextFormField(
      controller: email,
      decoration: InputDecoration(
        labelText: "Email",
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(focusPassword);
      },
      validator: (value) {
        if (!RegExp(regex).hasMatch(value)) {
          return "This is not a valid email";
        }
        return null;
      },
    );
  }

  Widget get _buildPasswordField {
    return TextFormField(
      controller: password,
      focusNode: focusPassword,
      onFieldSubmitted: (v) {
        _submitForm();
      },
      decoration: InputDecoration(
          labelText: "Password",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      validator: (value) {
        if (value.isEmpty) {
          return 'The password field cannot be empty';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return RaisedButton(
      onPressed: () => _submitForm(),
      child: Text('Login'),
    );
  }

  void _submitForm() {
    print('Submitting form');
    if (_formKey.currentState.validate()) {
      print('Form was validated');
    }
  }

  Widget _buildForgetPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('forgot password button was clicked'),
        child: Text(
          'Forgot Password?',
        style:TextStyle(
          color: Colors.white
        )
        ),
      ),
    );
  }
}

Widget _socialButtons() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      RaisedButton(
        onPressed: ()=>print('button is being pressed'),
        color: Color(0xff3B5999),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Image(
          image: AssetImage("images/Facebook icon.png"),
        ),
      ),
      SizedBox(
        width:30.0
      ),
      RaisedButton(
        onPressed: ()=>print('button is being pressed'),
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Image(
          image: AssetImage("images/Google icon.png"),
        ),
      ),
    ],
  );
}

Widget _createAccountButton() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
      child: Container(
      width:280,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),],
          ),

      child: FlatButton(
        onPressed: ()=>print('button is being pressed'),
        color: Colors.green,
        child: Text('Create an account',
        style:TextStyle(
          color:Colors.white
        )
        ),
      ),
    ),
  );
}


//one interesting thing that I learnt while working with Raised button is:
// The background color of the button won't change if the onPressed function is null