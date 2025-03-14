import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_practise/core/app_pallet.dart';

class AppTheme {

  static  _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderRadius:  BorderRadius.circular(10),
        borderSide:  BorderSide(
          color:  color,
          width: 3
        )
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    ),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),

      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2)
    )
  );
  
}