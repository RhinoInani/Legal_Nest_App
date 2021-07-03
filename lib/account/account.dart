import 'package:flutter/material.dart';
import 'package:legal_nest/account/components/accountsCard.dart';
import 'package:legal_nest/account/screens/previousPosts.dart';
import 'package:legal_nest/components/header.dart';
import 'package:legal_nest/signIn/signInScreen.dart';
import 'package:legal_nest/user.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: size.height * 0.12,
              // ),
              Header(text: "My Account"),
              SizedBox(
                height: size.height * 0.02,
              ),
              // Divider(
              //   height: 5,
              //   color: Colors.black87,
              //   thickness: 0.5,
              // ),
              AccountsCard(
                pressIcon: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PreviousPosts();
                  }));
                },
                icon: Icon(Icons.arrow_forward_ios),
                text: "My posts",
              ),
              AccountsCard(
                pressIcon: () async {
                  await auth.signOut();
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return SignInScreen();
                  }));
                },
                icon: Icon(Icons.arrow_forward_ios),
                text: "Log out",
              )
            ],
          ),
        ),
      ),
    );
  }
}
