import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:client/core/widgets/loader.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
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
    final isloading=ref.watch(authViewModelProvider)?.isLoading==true;
    ref.listen(authViewModelProvider, (_,next) {
      next?.when(
        loading: () {},
        error: (error, stackTrace) {
         showSnackBar(context, error.toString());
        },
        data: (data) {
          // TODO: Navigate to homepage
         /*  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)); */
        },
      );
    }
    ); 
    return Scaffold(
      appBar: AppBar(),
      body: isloading? loader(): Padding(
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
               final res =await AuthRemoteRepository().login(email: emailController.text, password: passwordController.text);
               final val=switch(res){
                 Left(value: final l)=>l,
                  Right(value: final r)=>r,
               };
               print(val);
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
