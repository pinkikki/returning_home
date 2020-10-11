import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:returning_home/ui/controllers/login_controller.dart';
import 'package:returning_home/ui/widgets/base.dart';

class Login extends HookWidget {
  static const routeName = '/login';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController =
        useProvider<LoginController>(loginControllerProvider);
    final form = loginController.form;
    return Scaffold(
      body: BaseViewOnScaffold(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: loginController.mailAddressController,
                    decoration: const InputDecoration(
                      labelText: 'mail address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => form.mailAddress = value,
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: loginController.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'password',
                    ),
                    onSaved: (value) => form.password = value,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: const Text(
                      'login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await loginController.signIn(
                          form.mailAddress,
                          form.password,
                        );
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
