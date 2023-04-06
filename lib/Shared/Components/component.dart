import 'package:flutter/material.dart';

Widget defaultForm(
        {required TextEditingController controler,
        bool obscureText = false,
        required TextInputAction textInputAction,
        Widget? suffixIcon,
        Widget? suffix,
        Icon? prefixIcon,
        String? labels,
        TextInputType? type,
        required Function? validator,
        Function(dynamic)? onFieldSubmitted}) =>
    TextFormField(
      keyboardType: type,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffix: suffix,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
          labelText: labels),
      controller: controler,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validator!(value);
        }
        return null;
      },
    );
