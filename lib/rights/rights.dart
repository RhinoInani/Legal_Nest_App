import 'dart:math';

import 'package:flutter/material.dart';
import 'package:legal_nest/constants.dart';

import 'components/boldText.dart';

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
            minWidth: size.width * 0.15,
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
            backgroundColor: Colors.transparent,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.directions_car),
                selectedIcon: Icon(Icons.directions_car),
                label: Text('Pulled Over'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.camera_alt),
                selectedIcon: Icon(Icons.camera_alt),
                label: Text('Record Events'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search),
                selectedIcon: Icon(Icons.search),
                label: Text('Search You'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.remove_red_eye),
                selectedIcon: Icon(Icons.remove_red_eye),
                label: Text('Search Car'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.local_police),
                selectedIcon: Icon(Icons.local_police),
                label: Text('Arrested'),
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
                SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                          text:
                              "What are my rights if I’m pulled over by the police? "),
                      Text(
                          "\n\u2022 It is critical that you remain calm if you are pulled over by the police while driving your car. Pull over as soon as it's safe, ensuring that you are not in the way of oncoming traffic, and turn off your engine. If you're the driver, turn on the interior light, open the window partially, and place your hands on the steering wheel. Passengers should keep their hands visible at all times."),
                      Text(
                          "\n\u2022 It's critical to be cool and avoid making any unexpected moves since the police are ready to respond at any time if they suspect they're in danger. Keep your hands visible to the officer and offer any relevant documents upon request, but only after they have asked for them. Reaching into your pocket or glove compartment without permission could lead to a confrontation."),
                      Text(
                          "\n\u2022 If you suspect your rights have been violated, memorize or write down badge or patrol car numbers, as well as witness contact information. It is legal for you to record video in order to do so. While the legal idea of \"qualified immunity\"—which states that officers can only be held liable for actions that violate \"clearly established\" federal law—makes it difficult for civilians to win cases against cops, don't let that deter you from reporting any misconduct you witness."),
                      BoldText(
                          text:
                              "\nDo police have to tell you why they pulled you over before asking for ID?"),
                      Text(
                          "\n\u2022 Generally speaking, no. Police do not have to tell you why they are stopping you before asking for ID in a traffic stop, though it may be a standard practice in many areas. The officer must have a reason—i.e., probable cause—for the stop, but they are not legally required to tell you. That said, if taken to court, the police officer must provide their reason. If you feel you are being stopped unlawfully, it is within your rights to capture video of the encounter."),
                      BoldText(
                          text:
                              "\nAm I legally required to get out of the car if an officer tells me to?"),
                      Text(
                          "\n\u2022 You have the right to remain in your vehicle if the authorities ask you to come out (to make sure you don't have a concealed weapon). To avoid escalation, it may be a good idea to acquiesce if they make this request; however, this depends on the situation. You have the right to remain silent as well, though it's a good idea to respond to simple queries (e.g., \"Do you know why I pulled you over?\") or make polite small conversation (e.g., \"Good morning officer.\")."),
                      Text(
                          "\n\u2022 If you are a passenger, you have the right to ask if you can leave. If the officer agrees, then you may leave. "),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                          text:
                              "May I record the police during an interaction?"),
                      Text(
                          "\n\u2022 You have the right to take images (video and still pictures) in a public place in all states, including actions by law enforcement, as long as you don’t interfere with their duties. This means that as long as you don't intervene, you have the right to film police contacts that don't involve you directly."),
                      Text(
                          "\n\u2022 Without a proper warrant, law enforcement officers cannot force you to delete your recordings and photos or demand that you surrender your phone or camera. While the freedom to record photographs is guaranteed by the federal government, the ability to record sound without the consent of the subjects differs by state."),
                      Text(
                          "\n\u2022 Regardless, the cops may try to seize your camera or force you to delete photographs. Inform them of your rights if they ask for your recording equipment or instruct you to cease recording. Once they discover you are aware of your rights, they may back off. "),
                      Text(
                          "\n\u2022 However, if the request escalates or becomes a demand, your best choice may be to cooperate (to avoid further escalation) and then file a police misconduct claim later.")
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(text: "May an officer search me?"),
                      Text(
                          "\n\u2022 If you are not under arrest or if the police do not have a legal warrant, they may not search you. If you refuse to submit to an unjustified search and they go ahead with it anyway, anything they find—even if it's incriminating—may be thrown out. The Fourth Amendment to the Constitution guarantees that no one can be searched or seized without a warrant."),
                      Text(
                          "\n\u2022 However, if the police have reasonable suspicion that you are carrying a weapon, they may pat you down through your clothing (without a warrant or arrest). Since the        rationale for a pat down often comes down to the officer's word vs the individual who was patted, this is one of those gray areas of law enforcement that has been  a source of controversy and friction in many communities."),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(text: "May the police search my car?"),
                      Text(
                          "\n\u2022 Even if the reason for the stop is small, they are permitted to search the area for indicators of illicit activity or contraband as long as it is in \"clear view.\" Officers may examine the car if they have reason to believe they are in imminent danger or detect evidence of a probable crime (such as blood splatter on the carseat)."),
                      Text(
                          "\n\u2022 However, unless they have a legal search warrant, you may refuse to open your trunk or glove compartment. However, if they have grounds to believe you are concealing a weapon, they may examine your glove compartment. You have waived your rights if you consent to a search. If you refuse to consent to a search and they conduct one nonetheless, any evidence uncovered may not be used against you."),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(text: "What happens if I am arrested?"),
                      Text(
                          "\n\u2022 When the police arrest you, they may read you your Miranda rights, but they are not required to do so right away. You have the right to remain silent even if the police delay your Miranda warning."),
                      BoldText(
                          text:
                              "\nYour Miranda rights include the following: "),
                      Text(
                          "\n\u2022 The right to remain silent. You are not required to answer questions about where you are going or coming from; what you are doing; where you live; or where you were born, whether you are a United States citizen, or how you entered the nation. If you choose to exercise this right, simply say so."),
                    ],
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
