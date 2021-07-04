import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:legal_nest/backend/constants.dart';
import 'package:legal_nest/signIn/components/signInButton.dart';
import 'package:legal_nest/signIn/components/signInTextField.dart';

import '../backend/backend.dart';
import '../backend/user.dart';

class NewPostPage extends StatefulWidget {
  NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController hashtagController = TextEditingController();

  String date = "Select Date";
  DateTime? picked = DateTime.now();
  PickedFile? _pickedFile;
  File? file;
  UploadTask? task;
  String videoUrl = "";

  @override
  void initState() {
    titleController.clear();
    bodyController.clear();
    hashtagController.clear();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    hashtagController.dispose();
    super.dispose();
  }

  String buttonText = "Done";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "New Post",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: kPrimaryDark,
                  fontSize: size.height * 0.03,
                  decoration: TextDecoration.underline,
                  decorationColor: kPrimaryLight,
                  decorationThickness: 0.5,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              CustomTextField(
                header: "Title",
                controller: titleController,
                hint: "The Title of Your Post",
                obscureText: false,
                textInputType: TextInputType.text,
                size: size,
                icon: null,
                height: size.height * 0.12,
              ),
              Container(
                width: size.width * 0.83,
                child: TextField(
                  controller: bodyController,
                  minLines: 5,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: "Post",
                    alignLabelWithHint: true,
                    hintText: "Post Context",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.02,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: size.height * 0.03,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: kPrimaryDark,
                      ),
                      gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryDark),
                      gapPadding: 10,
                    ),
                    errorStyle: TextStyle(color: Colors.red),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                    )),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SignInButton(
                size: size,
                buttonText: "$date",
                backgroundColor: kPrimaryLight,
                press: () {
                  _selectDate(context);
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SignInButton(
                size: size,
                buttonText: "Upload",
                backgroundColor: kPrimaryLight,
                press: () async {
                  final _picker = ImagePicker();
                  _pickedFile =
                      (await _picker.getVideo(source: ImageSource.gallery))!;
                  file = File(_pickedFile!.path);
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SignInButton(
                size: size,
                buttonText: "$buttonText",
                backgroundColor: kPrimaryDark,
                press: () async {
                  setState(() {
                    buttonText = "Uploading...";
                    fireStoreSize++;
                  });
                  var newPost = store.collection("posts").doc();
                  if (file != null) {
                    task = _uploadFile(file!);
                    await task!.whenComplete(() {}).then((value) async {
                      videoUrl = await value.ref.getDownloadURL();
                    });
                    // videoUrl = await snapshot.ref.getDownloadURL();
                  } else {
                    videoUrl = "";
                  }
                  Map<String, dynamic> post = {
                    'title': titleController.value.text,
                    'description': bodyController.value.text,
                    'eventDate': picked,
                    'supports': 0,
                    'posted': DateTime.now(),
                    'creator': currentUser!.user!.uid,
                    'video': "$videoUrl",
                    'supporters': <String>[],
                  };
                  newPost.set(post);
                  await readData(0);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: picked ??= DateTime.now(),
      firstDate: DateTime(2005),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.dark(
              primary: kPrimaryLight,
              onPrimary: Colors.black,
              surface: kPrimaryDark,
              onSurface: Colors.black,
              secondary: Colors.black,
              onSecondary: Colors.black,
              secondaryVariant: Colors.black,
              brightness: Brightness.dark,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    setState(() {
      date = DateFormat.yMMMMd('en_US').format(picked!);
    });
  }

  static UploadTask? _uploadFile(File file) {
    try {
      final ref = FirebaseStorage.instance.ref().child(currentUser!.user!.uid);
      return ref.putFile(file);
    } on FirebaseException catch (err) {
      print(err);
      return null;
    }
  }
}

// TextField(
//   controller: textController,
//   keyboardType: TextInputType.text,
//   textAlign: TextAlign.start,
//   textCapitalization: TextCapitalization.sentences,
//   decoration: InputDecoration(
//     hintText: "Title",
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(color: kPrimaryLight),
//       gapPadding: 10,
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: kPrimaryLight,
//       ),
//       gapPadding: 10,
//     ),
//   ),
// ),
