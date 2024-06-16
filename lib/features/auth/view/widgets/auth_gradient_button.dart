import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradienButton extends StatelessWidget {
  const AuthGradienButton({super.key, required this.buttontext,required this.onTap});
 final String buttontext;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient:
              LinearGradient(colors: [Pallete.gradient1, Pallete.gradient2])),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child:  Text(
          buttontext,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
