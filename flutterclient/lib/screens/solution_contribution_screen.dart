import 'package:flutter/material.dart';
import 'package:flutterclient/utilities/common_objects.dart';
import 'package:flutterclient/utilities/utility_helper.dart';
import 'package:flutterclient/api/api_users.dart';
import 'package:flutterclient/api/api_system.dart';
import 'package:flutterclient/api/api_submissions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterclient/animations/fade_animation.dart';

class SolutionContributionScreen extends StatefulWidget {
  const SolutionContributionScreen({
    Key key,
    @required this.isSolution,
  }) : super(key: key);

  final bool isSolution;
  @override
  _SolutionContributionScreenState createState() => new _SolutionContributionScreenState();
}

class _SolutionContributionScreenState extends State<SolutionContributionScreen> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Container(),
//    );
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
    color: Colors.white,
    child: Column(
      children: [
        TextFormField(
          validator: (val) {
            return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val)
                ? null
                : "Please Enter Correct Email";
          },
          style: simpleTextStyle(),
          decoration: textFieldInputDecoration(widget.isSolution ? "Solution name" : "Problem name"),
        ),
        widget.isSolution ?
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            obscureText: true,
            validator: (val) {
              return val.length > 6
                  ? null
                  : "Enter Password 6+ characters";
            },
            style: simpleTextStyle(),
            decoration: textFieldInputDecoration("Existing problem ID (Optional)"),
          ),
        )
        : Container(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            obscureText: true,
            validator: (val) {
              return val.length > 6
                  ? null
                  : "Enter Password 6+ characters";
            },
            style: simpleTextStyle(),
            decoration: textFieldInputDecoration("Description (max 150 characters)"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: textFieldInputDecoration("Additional details(Optional)"),
            keyboardType: TextInputType.multiline,
            minLines: 8,//Normal textInputField will be displayed
            maxLines: 10,// when user presses enter it will adapt to it
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top:40),
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.only(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff0062ff),
                      Color(0xff0062ff),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('Upload attachments', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        )
      ],
    ),
  );
  }
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black54),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}