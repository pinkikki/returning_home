import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:returning_home/widgets/unfocus.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _mailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final LoginForm _form = LoginForm();

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
                        final result = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _form.mailAddress,
                                password: _form.password);
                        // TODO 結果をグローバルステートに設定
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
