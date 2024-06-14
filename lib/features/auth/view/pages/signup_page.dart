import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up.",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
             CustomField(
              
              hintText: "name",
              textEditingController: nameController,
            ),
            const SizedBox(
              height: 15,
            ),
             CustomField(
              
              textEditingController: emailController,
              hintText: "email",
            ),
            const SizedBox(
              height: 15,
            ),
             CustomField(
              isObscureText: true,
              hintText: "password",
              textEditingController: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthGradienButton(),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(
              style: Theme.of(context).textTheme.titleMedium,
              text: "Already have an account? ",
              children: const [
                TextSpan(
                  text: "sign in?",
                  style: TextStyle(
                      color: Pallete.gradient2, fontWeight: FontWeight.bold),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
