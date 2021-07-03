import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:legal_nest/constants.dart';
import 'package:legal_nest/holder.dart';

import '../user.dart';
import 'components/signInButton.dart';
import 'components/signInTextField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String buttonText = "Login";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/LegalNestBackground.png"),
            //   fit: BoxFit.fill,
            // ),
            ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: kPrimaryDark,
                        fontSize: size.height * 0.05,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.combine([
                          TextDecoration.overline,
                          TextDecoration.underline,
                        ]),
                        decorationColor: kPrimaryLight,
                      ),
                      children: [
                        TextSpan(
                          text: "Legal",
                        ),
                        TextSpan(
                          text: " Nest",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decorationThickness: 0.5,
                            decorationStyle: TextDecorationStyle.dashed,
                          ),
                        ),
                      ]),
                ),
              ),
              Center(
                child: Container(
                  height: size.height * 0.15,
                  child: Image.asset("assets/legal_nest_logo.png"),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline5,
                    children: [
                      TextSpan(
                          text: "Welcome ",
                          style: TextStyle(color: kPrimaryDark)),
                      TextSpan(
                          text: "back!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLight,
                          ))
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      CustomTextField(
                        size: size,
                        header: "Email",
                        hint: "Enter your email",
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                        controller: username,
                        icon: Icon(Icons.email),
                        height: size.height * 0.12,
                      ),
                      CustomTextField(
                        size: size,
                        header: "Password",
                        hint: "Enter your password",
                        obscureText: true,
                        textInputType: TextInputType.text,
                        controller: password,
                        icon: Icon(Icons.lock),
                        height: size.height * 0.12,
                      ),
                      SignInButton(
                        size: size,
                        buttonText: "$buttonText",
                        backgroundColor: kPrimaryDark,
                        press: () async {
                          try {
                            currentUser = await auth.signInWithEmailAndPassword(
                              email: username.value.text.trim(),
                              password: password.value.text.trim(),
                            );
                            await store.collection("posts").get().then((value) {
                              print(value.size);
                              titles = List.generate(
                                value.size,
                                (index) => " ",
                                growable: true,
                              );
                              description = List.generate(
                                value.size,
                                (index) => " ",
                                growable: true,
                              );
                              videos = List.generate(
                                value.size,
                                (index) => " ",
                                growable: true,
                              );
                              usernames = List.generate(
                                value.size,
                                (index) => " ",
                                growable: true,
                              );
                              date = List.generate(
                                value.size,
                                (index) => " ",
                                growable: true,
                              );
                              supports = List.generate(
                                value.size,
                                (index) => index,
                                growable: true,
                              );
                            });
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              _readData();
                              return Holder();
                            }));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Timer(Duration(milliseconds: 1000), () {
                                setState(() {
                                  buttonText = "No user found";
                                });
                              });
                              setState(() {
                                buttonText = "Login";
                              });
                            } else if (e.code == 'wrong-password') {
                              Timer(Duration(milliseconds: 1000), () {
                                setState(() {
                                  buttonText = "Wrong password";
                                });
                              });
                            }
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Don't have an account?"),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign up here!",
                                style: TextStyle(
                                  color: kPrimaryLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _readData() {
    int counter;
    store.collection("posts").get().then((querySnapshot) {
      counter = 0;
      querySnapshot.docs.forEach((result) {
        titles!.insert(counter, result.get("title"));
        counter++;
      });
    });
    store.collection("posts").get().then((querySnapshot) {
      counter = 0;
      querySnapshot.docs.forEach((result) {
        description!.insert(counter, result.get("description"));
        counter++;
      });
    });
    store.collection("posts").get().then((querySnapshot) {
      counter = 0;
      querySnapshot.docs.forEach((result) {
        videos!.insert(counter, result.get("video"));
        counter++;
      });
    });
    store.collection("posts").get().then((querySnapshot) {
      counter = 0;
      querySnapshot.docs.forEach((result) {
        usernames!.insert(counter, result.get("creator"));
        counter++;
      });
    });
    store.collection("posts").get().then((querySnapshot) {
      counter = 0;
      querySnapshot.docs.forEach((result) {
        date!.insert(counter, result.get("eventDate").toString());
        counter++;
      });
    });
    store.collection("posts").get().then((querySnapshot) {
      counter = 0;
      querySnapshot.docs.forEach((result) {
        supports!.insert(counter, result.get("supports"));
        counter++;
      });
    });
  }
}
