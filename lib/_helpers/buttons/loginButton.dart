import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';

class LoginPageButton extends StatelessWidget {
  const LoginPageButton(
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
          side: BorderSide(color: kPrimaryGreenColor),
        ),
        onPressed: function,
        padding: EdgeInsets.all(15.0),
        color: kPrimaryGreenColor,
        textColor: Colors.white,
        child: Text(text, style: TextStyle(fontSize: 15)),
      ),
    );
  }
}
