import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
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
    final isLoading = ref.watch(authViewModelProvider)?.isLoading==true;
    ref.listen(authViewModelProvider, (_,next) {
      next?.when(
        loading: () {},
        error: (error, stackTrace) {
         showSnackBar(context, error.toString());

        },
        data: (data) {
         showSnackBar(context, "Account created successfully, please login.");
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        },
      );
    }
    );
    
    return Scaffold(
      appBar: AppBar(),
      body: isLoading? const loader(): Padding(
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
                  if (formkey.currentState!.validate()) {
                    
                 await ref.read(authViewModelProvider.notifier).signUpUser(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text);
                  }
                  


                  
                  
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
