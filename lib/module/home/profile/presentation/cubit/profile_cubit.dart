import 'package:bloc/bloc.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/home/product/domain/usecases/load_products.dart';
import 'package:dokan_app/module/home/profile/domain/entities/profile_user_entity.dart';
import 'package:dokan_app/module/home/profile/domain/usecases/load_profile.dart';
import 'package:dokan_app/module/home/profile/domain/usecases/update_profile.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._loadProfileUseCase, this._updateProfileUseCase)
      : super(ProfileInitial()) {
    loadProfile();
  }

  final LoadProfileUseCase _loadProfileUseCase;

  final UpdateProfileUseCase _updateProfileUseCase;

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    final response = await _loadProfileUseCase.call();

    response.fold(
        (error) => emit(ProfileError(
            error is ServerFailure ? error.message ?? 'error' : '')),
        (data) => emit(ProfileLoaded(data)));
  }

  Future<void> updateProfile(UpdateProfileParams params) async {
    final response = await _updateProfileUseCase.call(params: params);
    response.fold(
        (error) => emit(ProfileError(
            error is ServerFailure ? error.message ?? 'error' : '')),
        (data) => emit(ProfileLoaded(data)));
  }
}
