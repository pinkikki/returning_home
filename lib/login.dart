import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:returning_home/auth.dart';
import 'package:returning_home/map.dart';
import 'package:returning_home/widgets/unfocus.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _mailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final LoginForm _form = LoginForm();
  bool hasError = false;
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnFocus(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (hasError)
                  Container(
                    child: Text(
                      errorText,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Container(
                  child: TextFormField(
                    controller: _mailAddressController,
                    decoration: InputDecoration(
                      labelText: 'mail address',
                    ),
                    onSaved: (value) => _form.mailAddress = value,
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'password',
                    ),
                    onSaved: (value) => _form.password = value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: Text(
                      'login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        try {
                          final result = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _form.mailAddress,
                                  password: _form.password);
                          final auth = Provider.of<Auth>(context, listen: false);
                          auth.isAuth = true;
                          auth.credential = result;
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => Map(),
                              ),
                              (route) => false);
                        } on FirebaseAuthException catch (e) {
                          setState(
                            () {
                              hasError = true;
                              errorText = e.message;
                            },
                          );
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm {
  String mailAddress;
  String password;
}
