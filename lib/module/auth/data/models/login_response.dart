import 'package:dokan_app/module/auth/domain/entities/login_user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    String? token,
    String? user_email,
    String? user_nicename,
    String? user_display_name,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginUserEntity toEntity() {
    return LoginUserEntity(
      token: token,
      user_email: user_email,
      user_nicename: user_nicename,
      user_display_name: user_display_name,
    );
  }
}
