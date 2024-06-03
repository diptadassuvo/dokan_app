import 'package:bloc/bloc.dart';
import 'package:dokan_app/core/error/failure.dart';
import 'package:dokan_app/module/auth/domain/usecases/signup.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupUseCase) : super(SignupInitial());

  final SignupUseCase _signupUseCase;

  Future<void> signup(SignupParam params) async {
    emit(SignupLoading());
    final result = await _signupUseCase.call(params);
    result.fold(
      (failure) {
        emit(SignupError(
            failure is ServerFailure ? failure.message ?? 'error' : ''));
      },
      (success) => emit(SignupSuccess()),
    );
  }
}
