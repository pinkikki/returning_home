import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/frameworks/auth.dart';

final authStateProvider = StateProvider<AuthState>((ref) => AuthState());
