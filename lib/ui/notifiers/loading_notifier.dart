import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'loading_notifier.freezed.dart';

final loadingNotifierProvider =
    StateProvider<LoadingState>((ref) => const LoadingState());

@freezed
abstract class LoadingState with _$LoadingState {
  const factory LoadingState({
    @Default(false) bool isLoadingOverlay,
  }) = _LoadingState;
}
