import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key,  this.isObscureText=false,required this.hintText,required this.textEditingController});
  final String hintText;
  final TextEditingController textEditingController;
  final bool isObscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(hintText: hintText),
      obscureText: isObscureText,
      validator: (val) {
        if(val!.trim().isEmpty){
          return "$hintText is empty";
        }
        else {
          return null;
        }
      },
    );
  }
}
