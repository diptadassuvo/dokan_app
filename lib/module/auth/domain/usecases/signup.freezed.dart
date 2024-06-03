// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupParam _$SignupParamFromJson(Map<String, dynamic> json) {
  return _SignupParam.fromJson(json);
}

/// @nodoc
mixin _$SignupParam {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupParamCopyWith<SignupParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupParamCopyWith<$Res> {
  factory $SignupParamCopyWith(
          SignupParam value, $Res Function(SignupParam) then) =
      _$SignupParamCopyWithImpl<$Res, SignupParam>;
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class _$SignupParamCopyWithImpl<$Res, $Val extends SignupParam>
    implements $SignupParamCopyWith<$Res> {
  _$SignupParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupParamImplCopyWith<$Res>
    implements $SignupParamCopyWith<$Res> {
  factory _$$SignupParamImplCopyWith(
          _$SignupParamImpl value, $Res Function(_$SignupParamImpl) then) =
      __$$SignupParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class __$$SignupParamImplCopyWithImpl<$Res>
    extends _$SignupParamCopyWithImpl<$Res, _$SignupParamImpl>
    implements _$$SignupParamImplCopyWith<$Res> {
  __$$SignupParamImplCopyWithImpl(
      _$SignupParamImpl _value, $Res Function(_$SignupParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignupParamImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupParamImpl implements _SignupParam {
  const _$SignupParamImpl(
      {required this.username, required this.email, required this.password});

  factory _$SignupParamImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupParamImplFromJson(json);

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignupParam(username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupParamImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupParamImplCopyWith<_$SignupParamImpl> get copyWith =>
      __$$SignupParamImplCopyWithImpl<_$SignupParamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupParamImplToJson(
      this,
    );
  }
}

abstract class _SignupParam implements SignupParam {
  const factory _SignupParam(
      {required final String username,
      required final String email,
      required final String password}) = _$SignupParamImpl;

  factory _SignupParam.fromJson(Map<String, dynamic> json) =
      _$SignupParamImpl.fromJson;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignupParamImplCopyWith<_$SignupParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
