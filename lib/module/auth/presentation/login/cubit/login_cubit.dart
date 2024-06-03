import 'package:bloc/bloc.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/domain/usecases/login.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    // loading state
    emit(LoginLoading());
    final callResponse = await _loginUseCase
        .call(LoginParams(username: username, password: password));

    // error state
    callResponse.fold(
      (failure) {
        emit(LoginFailed(
            failure is ServerFailure ? failure.message ?? 'error' : ''));
      },
      (data) => emit(LoginSuccess()),
    );
  }
}
