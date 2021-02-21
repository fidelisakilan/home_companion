import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool loggedin = false;
  //text field state
  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STUDENT LOGIN'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xff232F4D),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Expanded(
                  child: Image(
                image: AssetImage('assets/logo.png'),
              )),
              TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(labelText: 'Password'),
                validator: (val) =>
                    val.length < 8 ? 'Enter an password 8 + char long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => pass = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    if (_formKey.currentState.validate()) {
                      loggedin = true;
                      print(email.toString());
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Container(
                width: double.infinity,
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    },
                    child: Text(
                      'Skip for Now',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}

const textInputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)));
