import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/data/providers.dart';
import 'package:returning_home/frameworks/auth.dart';
import 'package:returning_home/frameworks/error.dart';
import 'package:returning_home/ui/controllers/app_controller.dart';
import 'package:returning_home/ui/notifiers/auth_notifier.dart';
import 'package:returning_home/ui/pages/top.dart';

final loginControllerProvider = Provider((ref) => LoginController(ref.read));

class LoginController extends AppController {
  LoginController(Reader read) : super(read) {
    _auth = read(authProvider);
    _authState = read(authStateNotifierProvider);
  }

  Auth _auth;
  StateController<AuthState> _authState;
  final _mailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  final LoginForm _form = LoginForm();

  TextEditingController get mailAddressController => _mailAddressController;

  TextEditingController get passwordController => _passwordController;

  LoginForm get form => _form;

  Future<void> signIn(String email, String password) async {
    loadingNotifier.state =
        loadingNotifier.state.copyWith(loadingAfterBuild: true);
    try {
      final result = await _auth.signIn(
        email,
        password,
      );
      _authState.state = result;
      loadingNotifier.state =
          loadingNotifier.state.copyWith(loadingAfterBuild: false);
      navigatorKey.currentState.pop();
      await navigatorKey.currentState
          .pushNamedAndRemoveUntil(Top.routeName, (route) => false);
    } on AuthException catch (e) {
      loadingNotifier.state =
          loadingNotifier.state.copyWith(loadingAfterBuild: false);
      errorNotifier.state =
          AppError(message: 'Failed to authenticate.', cause: e);
    }
  }
}

class LoginForm {
  String mailAddress;
  String password;
}
