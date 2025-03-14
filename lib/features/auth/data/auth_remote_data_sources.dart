import 'package:flutter_clean_architecture_practise/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<String> logInWithEmailPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourcesImpl(this.supabaseClient);
  @override
  Future<String> signUpWithEmailPassword(
      // TODO: implement signUpWithEmailPassword

      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      if (response.user == null) {
        throw const ServerException("USer is Null!");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> logInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement logInWithEmailPassword
    throw UnimplementedError();
  }
}
