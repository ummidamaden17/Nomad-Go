import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_practise/core/app_theme.dart';
import 'package:flutter_clean_architecture_practise/core/secrets/app_secrets.dart';
import 'package:flutter_clean_architecture_practise/features/auth/presentation/pages/log_in_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnon);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home:  LogInPage(),
    );
  }
}
