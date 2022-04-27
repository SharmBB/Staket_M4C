// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/view/ForgotPassword/OTP.dart';
import 'package:flutter_application_1/view/SigninPage/Sigin.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ForgetPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  String? email;
  String? bodyError;
  // loader
  bool _isLoading = true;
  String? password;

  // String? token;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: kPrimaryGreenColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: 24,
                      color: kPrimaryGreenColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * (0.7 / 20)),
                const Text(
                  'We will Send a link to recover password',
                  style: TextStyle(
                    fontSize: 12,
                    color: kPrimaryGreenColor,
                  ),
                ),
                SizedBox(height: screenHeight * (1 / 20)),
                _email(),
                SizedBox(height: screenHeight * (1 / 20)),
                _reset(),
                SizedBox(height: screenHeight * (3 / 20)),
              ],
            ),
          ),
        ));
  }

  _email() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 30,
            offset: Offset(0, 0),
            spreadRadius: -25,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: TextStyle(fontSize: 16, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
            if (value!.isEmpty) {
              return 'Email Required';
            } else if (!regex.hasMatch(value)) {
              return 'Email Required';
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _emailController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 25),
            hintText: "E-mail",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email, color: Colors.grey),
            prefixIconConstraints: BoxConstraints(
              minWidth: 75,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  _reset() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: ButtonTheme(
            minWidth: 100.0,
            height: 30.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryGreenColor, // background
                onPrimary: Colors.transparent,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  _forgot();
                  // use the email provided here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OTPPage(email: _emailController.text)),
                  );
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
      ),
    );
  }

  void _forgot() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {
        "email": _emailController.text,
      };
      var res = await CallApi().postData(data, 'sendOTP');
      var body = json.decode(res.body);
      print(body);

      bodyError = body['message'];

      if (body['match'] == true) {
        print(body);
      } else {}
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
