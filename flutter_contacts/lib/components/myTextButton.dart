import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constants.dart';
import 'myText.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.primary,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double? fontSize;
  //myText
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? primary;

  @override
  Widget build(BuildContext context) {
    ConstantsClass constants = ConstantsClass.instance;
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: primary,
        ),
        child: MyText(
          text: text,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ));
  }
}
