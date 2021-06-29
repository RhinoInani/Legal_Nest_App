import 'package:flutter/material.dart';
import 'package:legal_nest/constants.dart';
import 'package:legal_nest/holder.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/LegalNestBackground.png"),
            fit: BoxFit.fill,
          ),
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
                child: Text(
                  "Legal Nest",
                  style: TextStyle(fontSize: size.height * 0.05),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
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
                        buttonText: "Login",
                        backgroundColor: kPrimaryDark,
                        press: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return Holder();
                          }));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
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
}
