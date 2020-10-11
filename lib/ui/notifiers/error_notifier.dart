import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/frameworks/error.dart';

final errorStateNotifierProvider = StateProvider((ref) => AppError());
