import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';

class MyText extends StatelessWidget {
  const MyText(
      {Key? key,
      required this.text,
      this.ayartextAlign,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.fontStyle,
      this.wordSpacing})
      : super(key: key);

  final String text;
  final TextAlign? ayartextAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? wordSpacing;

  @override
  Widget build(BuildContext context) {
    ConstantsClass constants = ConstantsClass.instance;
    return Text(
      text,
      textAlign: ayartextAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color ?? constants.myTextColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
      ),
    );
  }
}
