import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constants.dart';

class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
    this.icon,
    this.iconSize,
    this.focusColor,
  }) : super(key: key);
  final IconData? icon;
  final double? iconSize;
  final Color? focusColor;

  @override
  Widget build(BuildContext context) {
    ConstantsClass constants = ConstantsClass.instance;
    return FloatingActionButton(
        onPressed: () {},
        focusColor: focusColor ?? constants.myFABColor,
        child: Icon(
          icon,
          size: iconSize,
        ));
  }
}
