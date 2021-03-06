import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:legal_nest/account/account.dart';
import 'package:legal_nest/backend/constants.dart';
import 'package:legal_nest/camera/camera.dart';
import 'package:legal_nest/home/home.dart';
import 'package:legal_nest/newPosts/newPosts.dart';
import 'package:legal_nest/rights/rights.dart';

class Holder extends StatefulWidget {
  const Holder({Key? key}) : super(key: key);

  @override
  _HolderState createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: kPrimaryDark,
                          fontSize: 20,
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
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: kPrimaryDark,
                    ),
                    onPressed: () {
                      // store.collection("posts").get().then((value) => {
                      //       value.docs.forEach((element) {
                      //         test = element.data();
                      //         test!.forEach((key, value) {
                      //           print("$key : $value");
                      //         });
                      //       })
                      //     });
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return NewPostPage();
                      }));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          CameraPage(),
          RightsPage(),
          AccountPage(),
        ],
        onPageChanged: (index) {
          setState(
            () => _currentPage = index,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: BottomBar(
          itemPadding: EdgeInsets.all(size.height * 0.015),
          selectedIndex: _currentPage,
          onTap: (int index) {
            _pageController.jumpToPage(index);
            setState(() => _currentPage = index);
          },
          items: <BottomBarItem>[
            BottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              activeColor: kPrimaryDark,
              inactiveColor: Colors.blueGrey[300],
            ),
            BottomBarItem(
              icon: Icon(Icons.camera_alt),
              title: Text("Record"),
              activeColor: kPrimaryDark,
              inactiveColor: Colors.blueGrey[300],
            ),
            BottomBarItem(
              icon: Icon(Icons.info),
              title: Text('Rights'),
              activeColor: kPrimaryDark,
              inactiveColor: Colors.blueGrey[300],
            ),
            BottomBarItem(
              icon: Icon(Icons.person),
              title: Text('Account'),
              activeColor: kPrimaryDark,
              inactiveColor: Colors.blueGrey[300],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
