// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'loading_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoadingStateTearOff {
  const _$LoadingStateTearOff();

// ignore: unused_element
  _LoadingState call({bool isLoadingOverlay = false}) {
    return _LoadingState(
      isLoadingOverlay: isLoadingOverlay,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoadingState = _$LoadingStateTearOff();

/// @nodoc
mixin _$LoadingState {
  bool get isLoadingOverlay;

  $LoadingStateCopyWith<LoadingState> get copyWith;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
  $Res call({bool isLoadingOverlay});
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  final LoadingState _value;
  // ignore: unused_field
  final $Res Function(LoadingState) _then;

  @override
  $Res call({
    Object isLoadingOverlay = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingOverlay: isLoadingOverlay == freezed
          ? _value.isLoadingOverlay
          : isLoadingOverlay as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoadingStateCopyWith<$Res>
    implements $LoadingStateCopyWith<$Res> {
  factory _$LoadingStateCopyWith(
          _LoadingState value, $Res Function(_LoadingState) then) =
      __$LoadingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoadingOverlay});
}

/// @nodoc
class __$LoadingStateCopyWithImpl<$Res> extends _$LoadingStateCopyWithImpl<$Res>
    implements _$LoadingStateCopyWith<$Res> {
  __$LoadingStateCopyWithImpl(
      _LoadingState _value, $Res Function(_LoadingState) _then)
      : super(_value, (v) => _then(v as _LoadingState));

  @override
  _LoadingState get _value => super._value as _LoadingState;

  @override
  $Res call({
    Object isLoadingOverlay = freezed,
  }) {
    return _then(_LoadingState(
      isLoadingOverlay: isLoadingOverlay == freezed
          ? _value.isLoadingOverlay
          : isLoadingOverlay as bool,
    ));
  }
}

/// @nodoc
class _$_LoadingState with DiagnosticableTreeMixin implements _LoadingState {
  const _$_LoadingState({this.isLoadingOverlay = false})
      : assert(isLoadingOverlay != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLoadingOverlay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingState(isLoadingOverlay: $isLoadingOverlay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadingState'))
      ..add(DiagnosticsProperty('isLoadingOverlay', isLoadingOverlay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingState &&
            (identical(other.isLoadingOverlay, isLoadingOverlay) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingOverlay, isLoadingOverlay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoadingOverlay);

  @override
  _$LoadingStateCopyWith<_LoadingState> get copyWith =>
      __$LoadingStateCopyWithImpl<_LoadingState>(this, _$identity);
}

abstract class _LoadingState implements LoadingState {
  const factory _LoadingState({bool isLoadingOverlay}) = _$_LoadingState;

  @override
  bool get isLoadingOverlay;
  @override
  _$LoadingStateCopyWith<_LoadingState> get copyWith;
}
