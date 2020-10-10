import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/frameworks/auth.dart';
import 'package:returning_home/infra/firebase_auth.dart';

final authProvider = Provider<Auth>((ref) => FirebaseEmailAndPasswordAuth());
