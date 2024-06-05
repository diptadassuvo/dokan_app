import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';

class UpdateProfileUseCase {
  Future<ProfileUserEntity> call() async {
    return ProfileUserEntity(
      userName: 'dokan',
      firstName: 'dokan',
      lastName: 'dokan',
      emailAddress: 'dokan',
    );
  }
}

class UpdateProfileParams {
  final String? firstName;
  final String? lastName;

  UpdateProfileParams({required this.firstName, required this.lastName});
}
