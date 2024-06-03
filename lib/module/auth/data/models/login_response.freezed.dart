// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String? get token => throw _privateConstructorUsedError;
  String? get user_email => throw _privateConstructorUsedError;
  String? get user_nicename => throw _privateConstructorUsedError;
  String? get user_display_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {String? token,
      String? user_email,
      String? user_nicename,
      String? user_display_name});
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user_email = freezed,
    Object? user_nicename = freezed,
    Object? user_display_name = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user_email: freezed == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String?,
      user_nicename: freezed == user_nicename
          ? _value.user_nicename
          : user_nicename // ignore: cast_nullable_to_non_nullable
              as String?,
      user_display_name: freezed == user_display_name
          ? _value.user_display_name
          : user_display_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? token,
      String? user_email,
      String? user_nicename,
      String? user_display_name});
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user_email = freezed,
    Object? user_nicename = freezed,
    Object? user_display_name = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user_email: freezed == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String?,
      user_nicename: freezed == user_nicename
          ? _value.user_nicename
          : user_nicename // ignore: cast_nullable_to_non_nullable
              as String?,
      user_display_name: freezed == user_display_name
          ? _value.user_display_name
          : user_display_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl extends _LoginResponse {
  const _$LoginResponseImpl(
      {this.token, this.user_email, this.user_nicename, this.user_display_name})
      : super._();

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String? token;
  @override
  final String? user_email;
  @override
  final String? user_nicename;
  @override
  final String? user_display_name;

  @override
  String toString() {
    return 'LoginResponse(token: $token, user_email: $user_email, user_nicename: $user_nicename, user_display_name: $user_display_name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user_email, user_email) ||
                other.user_email == user_email) &&
            (identical(other.user_nicename, user_nicename) ||
                other.user_nicename == user_nicename) &&
            (identical(other.user_display_name, user_display_name) ||
                other.user_display_name == user_display_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, user_email, user_nicename, user_display_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse extends LoginResponse {
  const factory _LoginResponse(
      {final String? token,
      final String? user_email,
      final String? user_nicename,
      final String? user_display_name}) = _$LoginResponseImpl;
  const _LoginResponse._() : super._();

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String? get token;
  @override
  String? get user_email;
  @override
  String? get user_nicename;
  @override
  String? get user_display_name;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
