import 'package:client/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthGradienButton extends StatelessWidget {
  const AuthGradienButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient:
              LinearGradient(colors: [Pallete.gradient1, Pallete.gradient2])),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Pallete.transparentColor,
          shadowColor: Pallete.transparentColor,
        ),
        child: const Text(
          "Signup",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
