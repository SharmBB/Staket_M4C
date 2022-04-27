import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';

class LandingPageButton_2 extends StatelessWidget {
  const LandingPageButton_2(
      {Key? key, required this.text, required this.function})
      : super(key: key);
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(0),
      height: 70.0,
      width: screenWidth * 0.90,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
          side: BorderSide(
            color: kPrimaryGreenColor,
            width: 2.5,
          ),
        ),
        onPressed: function,
        padding: EdgeInsets.all(15.0),
        color: kPrimaryWhiteColor,
        textColor: kPrimaryGreenColor,
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
