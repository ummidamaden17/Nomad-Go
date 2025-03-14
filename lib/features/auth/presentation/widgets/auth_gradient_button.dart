import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_practise/core/app_pallet.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({
    super.key,
    required this.buttonText
    });
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppPallete.gradient1,
            AppPallete.gradient2,
            AppPallete.gradient3
          ]
          )
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
          fixedSize: Size(
            395, 
            55
            )
        ),
        onPressed: () {}, 
        child:  Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600
          ),)
        ),
    );
  }
}