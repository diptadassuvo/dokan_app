part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileUserEntity profileUserEntity;

  ProfileLoaded(this.profileUserEntity);
}

final class ProfileError extends ProfileState {
  final String? message;

  ProfileError(this.message);
}
