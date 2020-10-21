import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:returning_home/frameworks/error.dart';

part 'error_notifier.freezed.dart';

final errorStateNotifierProvider = StateProvider((ref) => const ErrorState());

@freezed
abstract class ErrorState with _$ErrorState {
  const factory ErrorState({
    @Default(false) bool hasError,
    AppError appError,
  }) = _ErrorState;
}
