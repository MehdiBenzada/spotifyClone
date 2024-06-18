import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
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
        child: Form(
          key: formkey,
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
              ), // sdsdds
              AuthGradienButton(
                buttontext: "Sign up",
                onTap: () async {
                  final res = await authRemoteRepository().signup(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text);
                  final val = switch (res) {
                    Left(value: final l) => l,
                    Right(value: final r) => r.toString(),
                  };
                  print(val);
                  
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: RichText(
                    text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium,
                  text: "Already have an account? ",
                  children: const [
                    TextSpan(
                      text: "sign in?",
                      style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
