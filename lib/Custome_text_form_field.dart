import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool ispassword;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final String? Function(String?)? validator;
  const CustomeTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,

    this.ispassword = false,
    this.validator,
    this.keyboardtype = TextInputType.text,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: ispassword,
      keyboardType: keyboardtype,
      validator: validator,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}