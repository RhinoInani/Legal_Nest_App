import 'package:flutter/material.dart';
import 'package:legal_nest/signIn/components/signInButton.dart';

import '../../constants.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  Icon supports = Icon(Icons.favorite_border);
  bool isSupport = false;
  int supportCounter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              splashColor: Colors.transparent,
              icon: supports,
              onPressed: () {
                setState(() {
                  if (!isSupport) {
                    supports = Icon(Icons.favorite);
                    isSupport = true;
                    supportCounter++;
                  } else if (isSupport) {
                    supports = Icon(Icons.favorite_border);
                    isSupport = false;
                    supportCounter--;
                  }
                });
              },
            ),
            Text("$supportCounter"),
            IconButton(
              splashColor: Colors.transparent,
              icon: Icon(Icons.flag_outlined),
              onPressed: () {},
            )
          ],
        ),
        Container(
          width: size.width * 0.8,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kSecondaryLight,
              width: 3,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                      ),
                    ),
                    Text(
                      "24 Feb 2021",
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  child: Container(
                    width: size.width * 0.73,
                    child: Text(
                      "Underserved Traffic Ticket",
                      style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryDark,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.73,
                  height: size.height * 0.25,
                  child: ListView(
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Proin suscipit blandit arcu sed euismod. Vivamus non "
                        "nisl eu elit mattis volutpat quis ac turpis. Suspendisse"
                        " vel orci sed dolor fermentum ultrices ut nec nunc."
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Proin suscipit blandit arcu sed euismod. Vivamus non "
                        "nisl eu elit mattis volutpat quis ac turpis. Suspendisse"
                        " vel orci sed dolor fermentum ultrices ut nec nunc."
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Proin suscipit blandit arcu sed euismod. Vivamus non "
                        "nisl eu elit mattis volutpat quis ac turpis. Suspendisse"
                        " vel orci sed dolor fermentum ultrices ut nec nunc.",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.025,
                  ),
                  child: SignInButton(
                    size: size,
                    buttonText: "Video",
                    backgroundColor: kPrimaryDark,
                    press: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
