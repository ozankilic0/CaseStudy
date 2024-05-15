import 'package:flutter/material.dart';

class ConstantsClass {
  static final ConstantsClass _instance = ConstantsClass._init();
  static ConstantsClass get instance => _instance;
  ConstantsClass._init();

  bool scaffoldNoAppBar = true;
  bool myScaffoldBodyIsCenter = true;
  Color myTextColor = const Color.fromARGB(255, 0, 0, 0);
  Color myTextButtonColor = const Color.fromARGB(19, 0, 15, 32);
  bool isOverFlowVisible = false;
  Color myFABColor = const Color.fromARGB(19, 0, 15, 32);
  Color myIconButtonColor = Colors.black;
  EdgeInsetsGeometry myPadding = const EdgeInsets.fromLTRB(14, 20, 14, 20);
}
