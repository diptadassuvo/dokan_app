import 'package:dartz/dartz.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';
import 'package:dokan_app/module/home/profile/domain/repos/profile_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile.freezed.dart';

part 'update_profile.g.dart';

class UpdateProfileUseCase {
  final ProfileRepo _profileRepo;

  UpdateProfileUseCase(this._profileRepo);

  Future<Either<Failure, ProfileUserEntity>> call(
      {required UpdateProfileParams params}) {
    return _profileRepo.updateProfile(params);
  }
}

@freezed
class UpdateProfileParams with _$UpdateProfileParams {
  const factory UpdateProfileParams({
    String? first_name,
    String? last_name,
  }) = _UpdateProfileParams;

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamsFromJson(json);
}
