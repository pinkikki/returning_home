import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/frameworks/error.dart';

final errorNotifierProvider = StateProvider((ref) => AppError());
