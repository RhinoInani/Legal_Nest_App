import 'package:flutter/material.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      "$text",
      textAlign: TextAlign.start,
      style: TextStyle(
        color: kPrimaryDark,
        fontSize: size.height * 0.04,
        decoration: TextDecoration.underline,
        decorationColor: kPrimaryLight,
        decorationThickness: 0.5,
      ),
    );
  }
}
