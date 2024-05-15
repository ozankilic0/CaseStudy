import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constants.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.iconSize,
    this.splashColor,
    this.highlightColor,
    this.splashRadius,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;
  final double? iconSize;
  final Color? splashColor;
  final Color? highlightColor;
  final double? splashRadius;

  @override
  Widget build(BuildContext context) {
    ConstantsClass constants = ConstantsClass.instance;

    return IconButton(
      onPressed: onPressed,
      highlightColor: highlightColor,
      icon: Icon(icon),
      splashRadius: splashRadius,
      color: color ?? constants.myIconButtonColor,
    );
  }
}
