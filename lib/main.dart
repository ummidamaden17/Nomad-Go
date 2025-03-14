import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_practise/core/app_theme.dart';
import 'package:flutter_clean_architecture_practise/core/secrets/app_secrets.dart';
import 'package:flutter_clean_architecture_practise/features/auth/data/auth_remote_data_sources.dart';
import 'package:flutter_clean_architecture_practise/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture_practise/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_clean_architecture_practise/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean_architecture_practise/features/auth/presentation/pages/auth_gate.dart';
import 'package:flutter_clean_architecture_practise/features/auth/presentation/pages/log_in_page.dart';
import 'package:flutter_clean_architecture_practise/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnon,
  );

  final authRemoteDataSource = AuthRemoteDataSourcesImpl();

  final authRepository = AuthRepositoryImpl(authRemoteDataSource);

  final userSignUp = UserSignUp(authRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(authRemoteDataSource),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: AuthGate(),
    );
  }
}
