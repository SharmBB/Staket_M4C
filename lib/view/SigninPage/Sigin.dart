// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/_helpers/buttons/loginButton.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/sharedPreference.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/view/ForgotPassword/ForgotPassword.dart';
import 'package:flutter_application_1/view/Homepage/Home.dart';
import 'package:flutter_application_1/view/Main/MainPage.dart';
import 'package:flutter_application_1/view/SigninPage/FirebaseService.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordControllerSignup =
      TextEditingController();
  final TextEditingController _emailControllerSignup = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? password;
  String? bodyError;
  String? confirm;

  late String hid;
  late String chapterid;
  late String image;
  bool isLoading = false;

  bool _isLoading = false;
  bool showPassword = true;
  bool showPasswordSignup = true;
  bool showPasswordSignup2 = true;
  bool showconfirmPassword = true;

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    User? result = FirebaseAuth.instance.currentUser;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: kPrimaryWhiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 160,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                    ),
                  ),
                  SizedBox(height: screenHeight * (1 / 20)),
                  DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 30,
                          child: TabBar(
                            indicatorColor: kPrimaryGreenColor,
                            labelColor: kPrimaryGreenColor,
                            unselectedLabelColor: kPrimaryGreyColor,
                            tabs: [
                              Tab(
                                text: 'Sign In',
                              ),
                              Tab(text: 'Get Started'),
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.73,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.purple, width: 0.5))),
                          child: TabBarView(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  //login screen
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 25),
                                        child: Text(
                                          "Login to your account",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * (1 / 20)),
                                  _email(),
                                  SizedBox(height: screenHeight * (0.25 / 20)),
                                  _password(),
                                  !_isLoading
                                      ? bodyError != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25, 0, 25, 0),
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  bodyError.toString(),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ))
                                          : SizedBox()
                                      : SizedBox(),
                                  SizedBox(height: screenHeight * (0.25 / 20)),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ForgetPassword()),
                                            );
                                          },
                                          child: Text(
                                            "Forgot  Password ?",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: kPrimaryGreyColor),
                                          ))),

                                  !_isLoading
                                      ? LoginPageButton(
                                          text: "Login",
                                          function: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState?.save();
                                              _login();
                                            }
                                          },
                                        )
                                      : CupertinoActivityIndicator(
                                          radius: 15,
                                        ),
                                  SizedBox(height: 20),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     signInwithGoogle();
                                  //     //     setState(() {
                                  //     //       isLoading = true;
                                  //     //     });
                                  //     //     FirebaseService service =
                                  //     //         new FirebaseService();
                                  //     //     try {
                                  //     //       await service.signInwithGoogle();
                                  //     //  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                                  //     //     } catch (e) {
                                  //     //       if (e is FirebaseAuthException) {
                                  //     //         showMessage(e.message!);
                                  //     //       }
                                  //     //     }
                                  //     //     setState(() {
                                  //     //       isLoading = false;
                                  //     //     });
                                  //   },
                                  //   child: Ink(
                                  //     //  color: Color(0xFF397AF3),
                                  //     child: Padding(
                                  //       padding: EdgeInsets.all(6),
                                  //       child: Wrap(
                                  //         crossAxisAlignment:
                                  //             WrapCrossAlignment.center,
                                  //         children: [
                                  //           Icon(Icons
                                  //               .android), // <-- Use 'Image.asset(...)' here
                                  //           SizedBox(width: 12),
                                  //           Text('Sign in with FaceBook'),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(height: 10),
                                  // Text('Or'),
                                  // SizedBox(height: 10),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     //      signInwithGoogle();
                                  //   },
                                  //   child: Ink(
                                  //     //  color: Color(0xFF397AF3),
                                  //     child: Padding(
                                  //       padding: EdgeInsets.all(6),
                                  //       child: Wrap(
                                  //         crossAxisAlignment:
                                  //             WrapCrossAlignment.center,
                                  //         children: [
                                  //           Icon(Icons
                                  //               .android), // <-- Use 'Image.asset(...)' here
                                  //           SizedBox(width: 12),
                                  //           Text('Sign in with Google'),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    //signup screen
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30.0, left: 25),
                                          child: Text(
                                            "Readfine Cannabis",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * (1 / 20)),
                                    _emailSignup(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    _passwordSignup(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    _confirmpassword(),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    LoginPageButton(
                                      text: "Join in community",
                                      function: () async {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState?.save();
                                          _signUp();
                                        }
                                      },
                                    ),
                                    SizedBox(
                                        height: screenHeight * (0.25 / 20)),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 80.0, right: 50.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "By creating an account you agree to Wasty Terms of use and Privacy policty .",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: primaryColor,
                                                ),
                                              )
                                            ]))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  //login FEILDS

//Email Feils
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

  //Password Feild
  _password() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
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
          style: TextStyle(fontSize: 16.0, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          obscureText: showPassword,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Password required';
            } else if (!regex.hasMatch(value)) {
              return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 25),
            hintText: "Create Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () => setState(() => showPassword = !showPassword),
                icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility),
                color: Colors.grey,
              ),
            ),
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

  //Sign In Button
  // _signIn() {
  //   return Container(
  //     alignment: Alignment.bottomCenter,
  //     child: GestureDetector(
  //       child: ButtonTheme(
  //         minWidth: 150.0,
  //         height: 40.0,
  //         child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             primary: kPrimaryGreenColor, // background
  //             onPrimary: Colors.transparent,
  //           ),
  //           onPressed: () {
  //             if (_formKey.currentState!.validate()) {
  //               _formKey.currentState?.save();
  //               _login();
  //             }
  //           },
  //           child: const Text(
  //             'Sign In',
  //             style: TextStyle(color: Colors.white, fontSize: 16),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

//SIGNup FEILD

//Email Feils
  _emailSignup() {
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
          controller: _emailControllerSignup,
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

  _confirmpassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
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
          style: TextStyle(fontSize: 16.0, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          obscureText: showPasswordSignup2,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Password required';
            } else if (!regex.hasMatch(value)) {
              return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
            } else if (value != _passwordControllerSignup.text) {
              return 'Not Matched';
            }
            return null;
          },
          onSaved: (String? val) {
            confirm = val;
          },
          controller: _confirmpasswordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 25),
            hintText: "Repeat Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () =>
                    setState(() => showPasswordSignup2 = !showPasswordSignup2),
                icon: Icon(showPasswordSignup2
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: Colors.grey,
              ),
            ),
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

  //Password Feild
  _passwordSignup() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
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
          style: TextStyle(fontSize: 16.0, color: primaryColor),
          cursorColor: kPrimaryGreenColor,
          keyboardType: TextInputType.text,
          obscureText: showPasswordSignup,
          validator: (value) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Password required';
            } else if (!regex.hasMatch(value)) {
              return 'Password Must contains \n - Minimum 1 Upper case \n - Minimum 1 lowercase \n - Minimum 1 Number \n - Minimum 1 Special Character \n - Minimum 8 letters';
            }
            return null;
          },
          onSaved: (String? val) {
            password = val;
          },
          controller: _passwordControllerSignup,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 25),
            hintText: "Password",
            hintStyle: TextStyle(
              color: Color(0xffA6B0BD),
            ),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () =>
                    setState(() => showPasswordSignup = !showPasswordSignup),
                icon: Icon(showPasswordSignup
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: Colors.grey,
              ),
            ),
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

//Login CAll API
  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      var res = await CallApi().loginData(data, 'login');
      var body = json.decode(res.body);
      if (body["errorMessage"] == false) {
// if (body['message']['token'] != null) {
        // SharedPreferences localStorage =
        //     await SharedPreferences.getInstance();

        // var token = body['message']['token'];
        // print(token);

        // var userId = body['message']["user"]["id"];
        // print(userId);

        // print("------------------------------------");
        // localStorage.setString('token', token);
        // print(token);
        //  print(userId);

        // localStorage.setInt('userId', userId);

        print(body['message']);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                  //builder: (BuildContext context) => ReplyComments(
                  // image: widget.image,
                  // chapterid: widget.chapterid,
                  // hid: widget.hid,

                  )),
        );
        //    }
      } else {
        // _showMsg(body['error']);
        setState(() {
          bodyError = body['message'];
          //_isLoading = false;
        });
        print(bodyError);
      }
    } catch (e) {
      print(e);
    }

    setState(
      () {
        _isLoading = false;
      },
    );
  }

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      var data = {
        "email": _emailControllerSignup.text,
        "password": _passwordControllerSignup.text,
      };

      var res = await CallApi().loginData(data, 'register');
      var body = json.decode(res.body);

      if (body["errorMessage"] == false) {
        if (body['message']['token'] != null) {
          MySharedPreferences.instance
              .setStringValue("token", body['message']['token']);
          // SharedPreferences localStorage =
          //     await SharedPreferences.getInstance();

          // var token = body['message']['token'];
          // print(token);

          // var userId = body['message']["user"]["id"];
          // print(userId);

          // print("------------------------------------");
          // localStorage.setString('token', token);
          // print(token);
          //  print(userId);

          // localStorage.setInt('userId', userId);

          print(body['message']);
          print("vxvxcv" + (body['message']['token'].toString()));

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(
                  //builder: (BuildContext context) => ReplyComments(
                  // image: widget.image,
                  // chapterid: widget.chapterid,
                  // hid: widget.hid,

                  ),
            ),
          );
        }
        //   }
      } else {
        // _showMsg(body['error']);
        setState(() {
          bodyError = body['message'];
          //_isLoading = false;
        });
        print(bodyError);
      }
    } catch (e) {
      print(e);
    }

    setState(
      () {
        _isLoading = false;
      },
    );
  }
}
