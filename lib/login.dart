import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:returning_home/auth.dart';
import 'package:returning_home/top.dart';
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
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                Container(
                  child: TextFormField(
                    controller: _mailAddressController,
                    decoration: const InputDecoration(
                      labelText: 'mail address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => _form.mailAddress = value,
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'password',
                    ),
                    onSaved: (value) => _form.password = value,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: const Text(
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
                          Provider.of<Auth>(context, listen: false)
                            ..isAuth = true
                            ..credential = result;
                          await Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute<bool>(
                                builder: (context) => Top(),
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
