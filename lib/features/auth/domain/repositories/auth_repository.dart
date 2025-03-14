import 'package:flutter_clean_architecture_practise/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  }); 

  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password
  }); 
}