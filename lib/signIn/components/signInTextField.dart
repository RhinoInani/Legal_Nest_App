import 'package:flutter/material.dart';
import 'package:legal_nest/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.header,
    this.controller,
    this.hint,
    this.obscureText,
    this.textInputType,
    required this.size,
    this.icon,
  }) : super(key: key);

  final String? header;
  final String? hint;
  final bool? obscureText;
  final TextInputType? textInputType;
  final Size size;
  final TextEditingController? controller;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.12,
      padding: EdgeInsets.all(size.height * 0.02),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText!,
        keyboardType: textInputType,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: icon,
          ),
          labelText: "$header",
          hintText: "$hint",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.02,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.03,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: kPrimaryDark,
            ),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: kPrimaryDark),
            gapPadding: 10,
          ),
          errorStyle: TextStyle(color: Colors.red),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
          )),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
