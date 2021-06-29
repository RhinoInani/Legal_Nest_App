import 'dart:math';

import 'package:flutter/material.dart';
import 'package:legal_nest/constants.dart';

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
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.15,
                ),
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
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.directions_car),
                selectedIcon: Icon(Icons.directions_car),
                label: Text('Driving'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.directions_bike_rounded),
                selectedIcon: Icon(Icons.directions_bike_outlined),
                label: Text('Biking'),
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
              pageSnapping: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  child: Center(child: Text("\u2022 Driving")),
                ),
                Container(
                  child: Center(child: Text("Biking")),
                ),
                Container(child: Center(child: Text("Home"))),
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
