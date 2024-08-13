import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

// ignore: must_be_immutable
class AuthField extends StatelessWidget {
  AuthField({
    super.key,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.isEnabled,
    this.hintText,
    this.onPasswordPressed,
    this.controller,
    this.validator,
    required this.keyboardType,
  });
  bool? isEnabled = true;
  String? hintText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  bool isPassword;
  TextEditingController? controller;
  String? Function(String?)? validator;
  final void Function()? onPasswordPressed;
  TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        color: MaterialTheme.lightScheme().onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      enabled: isEnabled,
      keyboardType: keyboardType,
      obscureText: isPassword,
      cursorColor: MaterialTheme.lightScheme().surfaceTint,
      decoration: InputDecoration(
        fillColor: MaterialTheme.lightScheme().tertiaryContainer,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPasswordPressed,
                icon: Icon(
                  suffixIcon,
                  size: 22,
                  color: MaterialTheme.lightScheme().surfaceTint,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: MaterialTheme.lightScheme().surfaceTint,
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        border: InputBorder.none,
        filled: true,
      ),
    );
  }
}
