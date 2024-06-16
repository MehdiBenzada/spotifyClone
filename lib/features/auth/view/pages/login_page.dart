import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
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
                "Sign In.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
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
               AuthGradienButton(buttontext: "Sign in",onTap: () async{
               await authRemoteRepository().login(email: emailController.text, password: passwordController.text);
              },),
              
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                
                },
                child: RichText(
                    text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium,
                  text: "don't have an account? ",
                  children: const [
                    TextSpan(
                      text: "sign up?",
                      style: TextStyle(
                          color: Pallete.gradient2, fontWeight: FontWeight.bold),
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
