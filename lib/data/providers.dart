import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/data/firebase/firebase_auth.dart';
import 'package:returning_home/frameworks/auth.dart';

final authProvider =
    Provider<Auth>((ref) => FirebaseEmailAndPasswordAuth());
