import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:legal_nest/constants.dart';
import 'package:legal_nest/signIn/components/signInButton.dart';
import 'package:legal_nest/signIn/components/signInTextField.dart';

class NewPostPage extends StatefulWidget {
  NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  TextEditingController textController = TextEditingController();

  String date = "Select Date";
  DateTime? picked;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
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
                controller: textController,
                hint: "The Title of Your Post",
                obscureText: false,
                textInputType: TextInputType.text,
                size: size,
                icon: null,
                height: size.height * 0.12,
              ),
              Container(
                width: size.width * 0.83,
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
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
                press: () {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SignInButton(
                size: size,
                buttonText: "Done",
                backgroundColor: kPrimaryDark,
                press: () {},
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
