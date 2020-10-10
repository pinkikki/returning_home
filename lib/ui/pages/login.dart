import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:returning_home/frameworks/auth.dart';
import 'package:returning_home/infra/providers.dart';
import 'package:returning_home/locator.dart';
import 'package:returning_home/ui/pages/auth.dart';
import 'package:returning_home/ui/pages/navigation.dart';
import 'package:returning_home/ui/pages/top.dart';
import 'package:returning_home/ui/widgets/unfocus.dart';

class Login extends StatefulHookWidget {
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
          margin: const EdgeInsets.symmetric(horizontal: 40),
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
                  margin: const EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    child: const Text(
                      'login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        try {
                          final auth = context.read(authProvider);
                          final authState = context.read(authStateProvider);
                          final result = await auth.signIn(
                            _form.mailAddress,
                            _form.password,
                          );
                          authState.state = result;
                          final route = MaterialPageRoute<bool>(
                            builder: (context) => Top(),
                          );
                          await locator
                              .get<NavigationController>()
                              .navigationKey
                              .currentState
                              .pushAndRemoveUntil(route, (route) => false);
                        } on AuthException catch (e) {
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
