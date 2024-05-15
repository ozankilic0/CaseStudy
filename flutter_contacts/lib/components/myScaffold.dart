import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'myText.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    this.noAppBar,
    this.fabLocation,
    this.bottomNavigationBar,
    required this.widgets,
  }) : super(key: key);
  final List<Widget> widgets;
  final bool? noAppBar;
  final FloatingActionButtonLocation? fabLocation;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    ConstantsClass constants = ConstantsClass.instance;
    return Center(
      child: Scaffold(
          backgroundColor: const Color(0xFFF4F4F4),
          appBar: noAppBar ?? constants.scaffoldNoAppBar
              ? null
              : AppBar(
                  title: const MyText(
                    text: "App Bar Deneme",
                  ),
                ),
          body: Padding(
            padding: constants.myPadding,
            child: SingleChildScrollView(
              child: Column(
                children: widgets,
              ),
            ),
          )),
    );
  }
}
