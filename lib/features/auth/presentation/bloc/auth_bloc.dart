import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture_practise/features/auth/data/auth_remote_data_sources.dart';

part "auth_event.dart";
part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthBloc(this.authRemoteDataSource) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthSignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    final email = event.email;
    final password = event.password;

    if (password.length < 6) {
      emit(AuthFailure(error: "Password cannot be less than 6 characters!"));
      return;
    }

    try {
      emit(AuthLoading());

      final userCredential = await authRemoteDataSource.logInWithEmailPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess(success: "Successfully logged in"));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(error: e.message ?? "An error occurred"));
    }
  }

  Future<void> _onSignUpRequested(
      AuthSignUpRequested event, Emitter<AuthState> emit) async {
    final email = event.email;
    final password = event.password;
    final userName = event.userName;

    if (password.length < 6) {
      emit(AuthFailure(error: "Password cannot be less than 6 characters!"));
      return;
    }

    try {
      emit(AuthLoading());

      await authRemoteDataSource.signUpWithEmailPassword(
        name: userName,
        email: email,
        password: password,
      );

      emit(AuthSuccess(success: "Successfully signed up!"));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(error: e.message ?? "An error occurred"));
    }
  }
}
