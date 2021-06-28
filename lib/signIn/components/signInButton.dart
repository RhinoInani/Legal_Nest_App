import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.size,
    required this.buttonText,
    required this.backgroundColor,
    required this.press,
  }) : super(key: key);

  final Size? size;
  final String? buttonText;
  final Color? backgroundColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        width: size!.width * 0.8,
        height: size!.height * 0.05,
        child: Center(
            child: Text(
          "$buttonText",
          style: TextStyle(
            fontSize: size!.height * 0.02,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
