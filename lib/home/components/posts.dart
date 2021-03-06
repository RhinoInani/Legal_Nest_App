import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:legal_nest/signIn/components/signInButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../backend/constants.dart';

class Post extends StatefulWidget {
  Post({
    Key? key,
    required this.showSupports,
    required this.username,
    required this.title,
    required this.description,
    required this.supportsValue,
    required this.video,
    required this.date,
  }) : super(key: key);

  final bool showSupports;
  final String username;
  final String title;
  final String description;
  final int supportsValue;
  final String video;
  final DateTime date;

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  Icon supports = Icon(Icons.favorite_border);
  bool isSupport = false;
  int supportCounter = 0;
  Color supportColor = kPrimaryDark;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true,
          forceWebView: false,
          headers: <String, String>{'header key': 'header value'});
    } else {
      throw 'Could not launch $url';
    }
  }

  int maxLines = 7;
  String readMoreText = "Read more";
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    supportCounter = widget.supportsValue;
    _controller = VideoPlayerController.network(
      '${widget.video}',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.showSupports
              ? Column(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      splashColor: Colors.transparent,
                      color: supportColor,
                      icon: supports,
                      onPressed: () {
                        setState(() {
                          if (!isSupport) {
                            supports = Icon(Icons.favorite);
                            supportColor = Colors.red;
                            isSupport = true;
                            supportCounter++;
                          } else if (isSupport) {
                            supports = Icon(Icons.favorite_border);
                            supportColor = kPrimaryDark;
                            isSupport = false;
                            supportCounter--;
                          }
                        });
                      },
                    ),
                    Text(
                      "$supportCounter",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.flag_outlined),
                      color: kSecondaryDark,
                      onPressed: () {
                        String report =
                            "https://docs.google.com/forms/d/e/1FAIpQLSfPSsMonSC7ADhO198a0XHIIqexHhpZRcyXtiQB2c8gnx_sHw/viewform?usp=sf_link";
                        _launchInBrowser(report);
                      },
                    )
                  ],
                )
              : Container(),
          Container(
            width: size.width * 0.8,
            // height: height,
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
                        "${widget.username}",
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      Text(
                        "${DateFormat.yMMMMd('en_US').format(widget.date)}",
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
                        "${widget.title}",
                        style: TextStyle(
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryDark,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width * 0.72,
                        child: Text(
                          "${widget.description}",
                          maxLines: maxLines,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      widget.description.length >= 350
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (maxLines == 7) {
                                    maxLines = 100;
                                    readMoreText = "Close";
                                  } else {
                                    maxLines = 7;
                                    readMoreText = "Read more";
                                  }
                                });
                              },
                              child: Text(
                                "$readMoreText",
                                style: TextStyle(color: Colors.blueGrey[300]),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.025,
                    ),
                    child: widget.video == ""
                        ? Container()
                        : SignInButton(
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
            ),
          ),
        ],
      ),
    );
  }

  void videoDialog(context, Size size) {
    Icon play = Icon(Icons.play_arrow);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    play = Icon(Icons.pause);
                    _controller.pause();
                  } else {
                    play = Icon(Icons.play_arrow);
                    _controller.play();
                  }
                });
              },
              icon: play,
            )
          ],
          content: Container(
            width: size.width * 0.9,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
