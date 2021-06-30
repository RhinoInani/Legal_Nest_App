import 'package:flutter/material.dart';
import 'package:legal_nest/rights/components/drivingList.dart';

class DrivingRights extends StatelessWidget {
  DrivingRights({Key? key}) : super(key: key);

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
          itemCount: driving.length,
          padding: EdgeInsets.all(15),
          itemBuilder: (context, int index) {
            if (index == drivingAmount[counter]) {
              counter++;
              return Text(
                driving[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.018,
                ),
              );
            } else if (index != drivingAmount[counter]) {
              return Text("\u2022 ${driving[index]}");
            } else {
              return Text("\u2022 ${driving[index]}");
            }
          }),
    );
    // return ListView(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(15),
    //       child: Center(
    //         child: RichText(
    //           softWrap: true,
    //           textAlign: TextAlign.start,
    //           text: TextSpan(
    //             style: TextStyle(color: kPrimaryDark),
    //             children: [
    //               TextSpan(
    //                 text:
    //                     "Both the driver and any passengers have the right to remain silent",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: size.height * 0.018),
    //               ),
    //               TextSpan(
    //                 text:
    //                     "\n\u2022 You don't have to answer questions like \"Where are you going?\", \"Where are you traveling from?\", etc. To exercise this right, you must say so aloud. In some states you may be required to identify yourself or be arrested",
    //               ),
    //               TextSpan(
    //                 text:
    //                     "\n\n\nIf you are a passenger, you can ask the officer to leave the car.",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: size.height * 0.018),
    //               ),
    //               TextSpan(
    //                 text:
    //                     "\n\u2022 If the officer tells you that you can leave the car, then you may silently leave.",
    //               ),
    //               TextSpan(
    //                 text: "\n\n\nMake the environment seem safe.",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: size.height * 0.018),
    //               ),
    //               TextSpan(
    //                 text:
    //                     "\n\u2022 Turn off the car, turn on the lights inside the car, partially open the window, and put your hands on the steering wheel (dashboard is you are a passenger)",
    //               ),
    //               TextSpan(
    //                 text: "\n\n\nDo what the officer tells you to do.",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: size.height * 0.018),
    //               ),
    //               TextSpan(
    //                 text:
    //                     "\n\u2022 When they request it, show the officer your license, registration, and proof of insurance. Avoid sudden movements and keep your hands where the officer can see them.",
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
