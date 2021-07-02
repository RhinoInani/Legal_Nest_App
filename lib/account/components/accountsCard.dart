import 'package:flutter/material.dart';

class AccountsCard extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Function? pressIcon;
  const AccountsCard({
    Key? key,
    this.text,
    this.icon,
    required this.pressIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressIcon as void Function()?,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.035,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$text",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                      ),
                    ),
                    IconButton(
                      onPressed: pressIcon as void Function()?,
                      icon: icon!,
                      iconSize: MediaQuery.of(context).size.height * 0.03,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Divider(
          //   height: 5,
          //   color: Colors.black87,
          //   thickness: 0.5,
          // ),
        ],
      ),
    );
  }
}
