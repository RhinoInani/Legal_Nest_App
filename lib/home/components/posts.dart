import 'package:flutter/material.dart';
import 'package:legal_nest/signIn/components/signInButton.dart';

import '../../constants.dart';

class Post extends StatefulWidget {
  Post({
    Key? key,
    required this.showSupports,
    required this.username,
    required this.title,
    required this.description,
    required this.supportsValue,
    required this.video,
  }) : super(key: key);

  final bool showSupports;
  final String username;
  final String title;
  final String description;
  final int supportsValue;
  final String video;

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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.showSupports
              ? Column(
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
                )
              : Container(),
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
                        "${widget.title}",
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
                      padding: EdgeInsets.zero,
                      children: [
                        Text("${widget.description}"),
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
      ),
    );
  }
}
