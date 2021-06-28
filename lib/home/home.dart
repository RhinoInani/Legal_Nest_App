import 'package:flutter/material.dart';
import 'package:legal_nest/signIn/components/signInButton.dart';
import 'package:video_player/video_player.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  Icon thumbsUp = Icon(Icons.thumb_up_alt_outlined);
  bool isThumbsUp = false;
  int thumbsUpCounter = 0;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: [
          buildPost(size),
        ],
      ),
    );
  }

  void videoDialog(context, Size size) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          );
        });
  }

  Row buildPost(Size size) {
    return Row(
      children: [
        Column(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              splashColor: Colors.transparent,
              icon: thumbsUp,
              onPressed: () {
                setState(() {
                  if (!isThumbsUp) {
                    thumbsUp = Icon(Icons.thumb_up);
                    isThumbsUp = true;
                    thumbsUpCounter++;
                  } else if (isThumbsUp) {
                    thumbsUp = Icon(Icons.thumb_up_alt_outlined);
                    isThumbsUp = false;
                    thumbsUpCounter--;
                  }
                });
              },
            ),
            Text("$thumbsUpCounter"),
            IconButton(
              splashColor: Colors.transparent,
              icon: Icon(Icons.flag_outlined),
              onPressed: () {},
            )
          ],
        ),
        Container(
            width: size.width * 0.8,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: kSecondaryLight,
                width: 3,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Text(
                        "24 Feb 2021",
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Container(
                      width: size.width * 0.73,
                      child: Text(
                        "Underserved Traffic Ticket",
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryDark,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.73,
                    height: size.height * 0.25,
                    child: ListView(
                      children: [
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "Proin suscipit blandit arcu sed euismod. Vivamus non "
                            "nisl eu elit mattis volutpat quis ac turpis. Suspendisse"
                            " vel orci sed dolor fermentum ultrices ut nec nunc."
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "Proin suscipit blandit arcu sed euismod. Vivamus non "
                            "nisl eu elit mattis volutpat quis ac turpis. Suspendisse"
                            " vel orci sed dolor fermentum ultrices ut nec nunc."
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                            "Proin suscipit blandit arcu sed euismod. Vivamus non "
                            "nisl eu elit mattis volutpat quis ac turpis. Suspendisse"
                            " vel orci sed dolor fermentum ultrices ut nec nunc."),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.025,
                    ),
                    child: SignInButton(
                      size: size,
                      buttonText: "Video",
                      backgroundColor: kPrimaryDark,
                      press: () {
                        videoDialog(context, size);
                      },
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
