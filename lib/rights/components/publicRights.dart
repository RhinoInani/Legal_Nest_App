import 'package:flutter/material.dart';

import '../../constants.dart';

class PublicRights extends StatelessWidget {
  const PublicRights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Center(
            child: RichText(
              softWrap: true,
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(color: kPrimaryDark),
                children: [
                  TextSpan(
                    text:
                        "Pulled over Both the driver and any passengers have the right to remain silent.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.018),
                  ),
                  TextSpan(
                    text:
                        "\n\u2022 You don't have to answer questions like \"Where are you going?\", \"Where are you traveling from?\", etc. To exercise this right, you must say so aloud. In some states you may be required to identify yourself or be arrested",
                  ),
                  TextSpan(
                    text:
                        "\n\n\nYou do not have to consent to a search of yourself or your belongings",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.018),
                  ),
                  TextSpan(
                    text:
                        "\n\u2022 A police officer can however pat your clothing down if they suspect you have a weapon. Even if an officer carries out a search despite your objection, stating that you do not give consent helps preserve your rights during any future legal proceedings.",
                  ),
                  TextSpan(
                    text:
                        "\n\n\nIf you are arrested by police, you have the right to a government-appointed lawyer if you cannot afford one.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.018),
                  ),
                  TextSpan(
                    text:
                        "\n\n\nYou do not have to answer questions about where you were born, whether you are a U.S. citizen, or how you entered the country.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.018),
                  ),
                  TextSpan(
                    text: "\n\n\nStay calm",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.018),
                  ),
                  TextSpan(
                    text:
                        "\n\u2022 Remember not to resist or obstruct the officers. Do not give the officers false information and make sure the police can see your hands.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
