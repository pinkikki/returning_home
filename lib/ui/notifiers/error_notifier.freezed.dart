// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'error_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ErrorStateTearOff {
  const _$ErrorStateTearOff();

// ignore: unused_element
  _ErrorState call({bool hasError = false, AppError appError}) {
    return _ErrorState(
      hasError: hasError,
      appError: appError,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ErrorState = _$ErrorStateTearOff();

/// @nodoc
mixin _$ErrorState {
  bool get hasError;
  AppError get appError;

  $ErrorStateCopyWith<ErrorState> get copyWith;
}

/// @nodoc
abstract class $ErrorStateCopyWith<$Res> {
  factory $ErrorStateCopyWith(
          ErrorState value, $Res Function(ErrorState) then) =
      _$ErrorStateCopyWithImpl<$Res>;
  $Res call({bool hasError, AppError appError});
}

/// @nodoc
class _$ErrorStateCopyWithImpl<$Res> implements $ErrorStateCopyWith<$Res> {
  _$ErrorStateCopyWithImpl(this._value, this._then);

  final ErrorState _value;
  // ignore: unused_field
  final $Res Function(ErrorState) _then;

  @override
  $Res call({
    Object hasError = freezed,
    Object appError = freezed,
  }) {
    return _then(_value.copyWith(
      hasError: hasError == freezed ? _value.hasError : hasError as bool,
      appError: appError == freezed ? _value.appError : appError as AppError,
    ));
  }
}

/// @nodoc
abstract class _$ErrorStateCopyWith<$Res> implements $ErrorStateCopyWith<$Res> {
  factory _$ErrorStateCopyWith(
          _ErrorState value, $Res Function(_ErrorState) then) =
      __$ErrorStateCopyWithImpl<$Res>;
  @override
  $Res call({bool hasError, AppError appError});
}

/// @nodoc
class __$ErrorStateCopyWithImpl<$Res> extends _$ErrorStateCopyWithImpl<$Res>
    implements _$ErrorStateCopyWith<$Res> {
  __$ErrorStateCopyWithImpl(
      _ErrorState _value, $Res Function(_ErrorState) _then)
      : super(_value, (v) => _then(v as _ErrorState));

  @override
  _ErrorState get _value => super._value as _ErrorState;

  @override
  $Res call({
    Object hasError = freezed,
    Object appError = freezed,
  }) {
    return _then(_ErrorState(
      hasError: hasError == freezed ? _value.hasError : hasError as bool,
      appError: appError == freezed ? _value.appError : appError as AppError,
    ));
  }
}

/// @nodoc
class _$_ErrorState with DiagnosticableTreeMixin implements _ErrorState {
  const _$_ErrorState({this.hasError = false, this.appError})
      : assert(hasError != null);

  @JsonKey(defaultValue: false)
  @override
  final bool hasError;
  @override
  final AppError appError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErrorState(hasError: $hasError, appError: $appError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErrorState'))
      ..add(DiagnosticsProperty('hasError', hasError))
      ..add(DiagnosticsProperty('appError', appError));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorState &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)) &&
            (identical(other.appError, appError) ||
                const DeepCollectionEquality()
                    .equals(other.appError, appError)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasError) ^
      const DeepCollectionEquality().hash(appError);

  @override
  _$ErrorStateCopyWith<_ErrorState> get copyWith =>
      __$ErrorStateCopyWithImpl<_ErrorState>(this, _$identity);
}

abstract class _ErrorState implements ErrorState {
  const factory _ErrorState({bool hasError, AppError appError}) = _$_ErrorState;

  @override
  bool get hasError;
  @override
  AppError get appError;
  @override
  _$ErrorStateCopyWith<_ErrorState> get copyWith;
}
