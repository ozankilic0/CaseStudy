import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.onTap,
    this.hintText,
    this.hintTextColor,
    this.teController,
    this.keyboard,
    this.maxLines,
    this.maxLength,
    this.fillColor,
    this.border,
    this.suffixIcon,
    this.suffixIconColor,
    this.filled,
  }) : super(key: key);
  final VoidCallback onTap;
  final String? hintText;
  final Color? hintTextColor;
  final TextEditingController? teController;

  final TextInputType? keyboard;
  final int? maxLines;
  final int? maxLength;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? border;
  final dynamic suffixIcon;
  final dynamic suffixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      onTap: onTap,
      controller: teController,
      maxLength: maxLength,
      maxLines: maxLines,
      keyboardType: keyboard,
      decoration: InputDecoration(
        border: border,
        filled: filled ?? true,
        fillColor: fillColor ?? Colors.white,
        suffixIcon: suffixIcon == null
            ? null
            : Icon(
                suffixIcon,
                color: suffixIconColor,
              ),
        hintText: hintText,
      ),
    );
  }
}
