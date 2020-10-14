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
  _LoadingState call(
      {bool loadingAfterBuild = false, bool loadingOnInitialization = true}) {
    return _LoadingState(
      loadingAfterBuild: loadingAfterBuild,
      loadingOnInitialization: loadingOnInitialization,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoadingState = _$LoadingStateTearOff();

/// @nodoc
mixin _$LoadingState {
  bool get loadingAfterBuild;
  bool get loadingOnInitialization;

  $LoadingStateCopyWith<LoadingState> get copyWith;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
  $Res call({bool loadingAfterBuild, bool loadingOnInitialization});
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  final LoadingState _value;
  // ignore: unused_field
  final $Res Function(LoadingState) _then;

  @override
  $Res call({
    Object loadingAfterBuild = freezed,
    Object loadingOnInitialization = freezed,
  }) {
    return _then(_value.copyWith(
      loadingAfterBuild: loadingAfterBuild == freezed
          ? _value.loadingAfterBuild
          : loadingAfterBuild as bool,
      loadingOnInitialization: loadingOnInitialization == freezed
          ? _value.loadingOnInitialization
          : loadingOnInitialization as bool,
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
  $Res call({bool loadingAfterBuild, bool loadingOnInitialization});
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
    Object loadingAfterBuild = freezed,
    Object loadingOnInitialization = freezed,
  }) {
    return _then(_LoadingState(
      loadingAfterBuild: loadingAfterBuild == freezed
          ? _value.loadingAfterBuild
          : loadingAfterBuild as bool,
      loadingOnInitialization: loadingOnInitialization == freezed
          ? _value.loadingOnInitialization
          : loadingOnInitialization as bool,
    ));
  }
}

/// @nodoc
class _$_LoadingState with DiagnosticableTreeMixin implements _LoadingState {
  const _$_LoadingState(
      {this.loadingAfterBuild = false, this.loadingOnInitialization = true})
      : assert(loadingAfterBuild != null),
        assert(loadingOnInitialization != null);

  @JsonKey(defaultValue: false)
  @override
  final bool loadingAfterBuild;
  @JsonKey(defaultValue: true)
  @override
  final bool loadingOnInitialization;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingState(loadingAfterBuild: $loadingAfterBuild, loadingOnInitialization: $loadingOnInitialization)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadingState'))
      ..add(DiagnosticsProperty('loadingAfterBuild', loadingAfterBuild))
      ..add(DiagnosticsProperty(
          'loadingOnInitialization', loadingOnInitialization));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingState &&
            (identical(other.loadingAfterBuild, loadingAfterBuild) ||
                const DeepCollectionEquality()
                    .equals(other.loadingAfterBuild, loadingAfterBuild)) &&
            (identical(
                    other.loadingOnInitialization, loadingOnInitialization) ||
                const DeepCollectionEquality().equals(
                    other.loadingOnInitialization, loadingOnInitialization)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loadingAfterBuild) ^
      const DeepCollectionEquality().hash(loadingOnInitialization);

  @override
  _$LoadingStateCopyWith<_LoadingState> get copyWith =>
      __$LoadingStateCopyWithImpl<_LoadingState>(this, _$identity);
}

abstract class _LoadingState implements LoadingState {
  const factory _LoadingState(
      {bool loadingAfterBuild, bool loadingOnInitialization}) = _$_LoadingState;

  @override
  bool get loadingAfterBuild;
  @override
  bool get loadingOnInitialization;
  @override
  _$LoadingStateCopyWith<_LoadingState> get copyWith;
}
