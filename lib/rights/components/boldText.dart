import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  const BoldText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.021,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
