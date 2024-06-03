// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      token: json['token'] as String?,
      user_email: json['user_email'] as String?,
      user_nicename: json['user_nicename'] as String?,
      user_display_name: json['user_display_name'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user_email': instance.user_email,
      'user_nicename': instance.user_nicename,
      'user_display_name': instance.user_display_name,
    };
