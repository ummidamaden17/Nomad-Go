import 'package:flutter_clean_architecture_practise/core/error/failures.dart';
import 'package:flutter_clean_architecture_practise/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, String>> logInWithEmailPassword({required String email, required String password}) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({required String name, required String email, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }
  
}