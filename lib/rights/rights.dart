import 'dart:math';

import 'package:flutter/material.dart';
import 'package:legal_nest/constants.dart';
import 'package:legal_nest/rights/components/drivingRights.dart';
import 'package:legal_nest/rights/components/publicRights.dart';

class RightsPage extends StatefulWidget {
  RightsPage({Key? key}) : super(key: key);

  @override
  _RightsPageState createState() => _RightsPageState();
}

class _RightsPageState extends State<RightsPage> {
  int selectedIndex = 0;
  double angle = 2 * pi;
  bool extended = false;
  PageController _pageController = PageController();
  String testRight = "\b "
      "\n\bYou do not have to consent to a search of yourself or your belongings";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            minExtendedWidth: size.width * 0.2,
            extended: extended,
            leading: Column(
              children: [
                // SizedBox(
                //   height: size.height * 0.1,
                //   width: size.width * 0.15,
                // ),
                Transform.rotate(
                  angle: angle,
                  child: IconButton(
                    icon: Icon(Icons.chevron_right),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        extended = !extended;
                        angle = extended ? pi : 2 * pi;
                      });
                    },
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.directions_car),
                selectedIcon: Icon(Icons.directions_car),
                label: Text('Driving'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.emoji_people),
                selectedIcon: Icon(Icons.emoji_people),
                label: Text('Outside'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search),
                label: Text('Search'),
              ),
            ],
            selectedIconTheme: IconThemeData(color: kPrimaryDark),
            unselectedIconTheme: IconThemeData(color: kPrimaryLight),
            selectedLabelTextStyle: TextStyle(color: kPrimaryDark),
            unselectedLabelTextStyle: TextStyle(color: kPrimaryLight),
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
                _pageController.jumpToPage(index);
              });
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              pageSnapping: false,
              physics: NeverScrollableScrollPhysics(),
              children: [
                DrivingRights(),
                PublicRights(),
                Container(
                  child: Center(
                    child: Text("Home"),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Search"),
                  ),
                ),
              ],
              onPageChanged: (index) {
                setState(() => selectedIndex = index);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
