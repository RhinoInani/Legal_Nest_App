import 'package:flutter/material.dart';
import 'package:legal_nest/backend/constants.dart';

import '../backend/backend.dart';
import '../backend/user.dart';
import 'components/posts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: RefreshIndicator(
        color: kPrimaryDark,
        onRefresh: () async {
          await readData(0);
        },
        child: ListView.builder(
          itemCount: description!.length,
          itemBuilder: (BuildContext context, int index) {
            return Post(
              title: titles![index],
              supportsValue: supports![index],
              description: description![index],
              username: usernames![index],
              showSupports: true,
              video: videos![index],
              date: date![index],
            );
          },
        ),
      ),
    );
  }

  // Post(
  //             showSupports: true,
  //           ),
  // SizedBox(
  //   height: size.height * 0.1,
  // ),
  // Column(
  //   children: [
  //     Container(
  //       child: FutureBuilder(
  //         future: _initializeVideoPlayerFuture,
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             // If the VideoPlayerController has finished initialization, use
  //             // the data it provides to limit the aspect ratio of the video.
  //             return AspectRatio(
  //               aspectRatio: _controller.value.aspectRatio,
  //               // Use the VideoPlayer widget to display the video.
  //               child: VideoPlayer(_controller),
  //             );
  //           } else {
  //             // If the VideoPlayerController is still initializing, show a
  //             // loading spinner.
  //             return Center(child: CircularProgressIndicator());
  //           }
  //         },
  //       ),
  //     ),
  //   ],
  // ),
}
