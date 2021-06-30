import 'package:flutter/material.dart';
import 'package:legal_nest/components/header.dart';
import 'package:legal_nest/home/components/posts.dart';

class PreviousPosts extends StatelessWidget {
  const PreviousPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Header(text: "My Posts"),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Post(showSupports: false),
            SizedBox(
              height: size.height * 0.03,
            ),
            Post(showSupports: false),
          ],
        ),
      ),
    );
  }
}
