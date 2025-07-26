import 'package:bloc/bloc.dart';
import 'package:firebase_login_test/features/auth/domain/entities/user_entite.dart';
import 'package:firebase_login_test/features/auth/domain/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    String phoneNumber,
  ) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
      phoneNumber,
    );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntite) => emit(SignupSuccess(userEntite: userEntite)),
    );
  }
}
