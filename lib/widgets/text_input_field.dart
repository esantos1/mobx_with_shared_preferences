import 'package:flutter/material.dart';
import 'package:mobxtest/constants.dart';

class TextInputField extends StatelessWidget {
  final TextAlign textAlign;
  final String? labelText;
  final TextEditingController? controller;
  final String? hintText;
  final bool isPasswordField;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const TextInputField({
    super.key,
    this.labelText,
    this.controller,
    this.isPasswordField = false,
    this.onChanged,
    this.textInputAction,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      controller: controller,
      textAlign: textAlign,
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
        border: OutlineInputBorder(borderRadius: borderRadius),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: borderRadius,
        ),
      ),
      obscureText: isPasswordField,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );

    if (labelText != null && labelText!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText!,
            style: TextStyle(color: whiteColor, fontSize: 18.0),
          ),
          SizedBox(height: 10.0),
          textField,
        ],
      );
    } else {
      return textField;
    }
  }
}
