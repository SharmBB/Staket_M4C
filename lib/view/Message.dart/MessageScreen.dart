// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/parts/drawer.dart';
import 'package:flutter_application_1/view/Chat/chatPage.dart';
import 'package:flutter_application_1/view/Message.dart/chart.dart';
import 'package:flutter_application_1/view/Message.dart/reusable.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<Map> newmessage = [
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Dennis Matthews',
      'Subtitle': 'Tommorrow Is My Birthday',
      'email': 'abc@gmail.com'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Janu Matthews',
      'Subtitle': 'Yesterday Is My Birthday',
      'email': 'xyz@gmail.com'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Kithu Matthews',
      'Subtitle': 'Tommorrow Is My Birthday',
      'email': 'demo@gmail.com'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Dennis Matthews',
      'Subtitle': 'Tommorrow Is My Birthday',
      'email': 'xxx@gmail.com'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Janu Matthews',
      'Subtitle': 'Yesterday Is My Birthday',
      'email': 'akgf@gmail.com'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Kithu Matthews',
      'Subtitle': 'Tommorrow Is My Birthday',
      'email': 'abc25@gmail.com'
    },
  ];

  final List<Map> oldmessage = [
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Dennis Matthews',
      'Subtitle': 'Tommorrow Is My Birthday'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Janu Matthews',
      'Subtitle': 'Yesterday Is My Birthday'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Kithu Matthews',
      'Subtitle': 'Tommorrow Is My Birthday'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Dennis Matthews',
      'Subtitle': 'Tommorrow Is My Birthday'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Janu Matthews',
      'Subtitle': 'Yesterday Is My Birthday'
    },
    {
      'Picture': 'assets/lonewolf.png',
      'Title': 'Kithu Matthews',
      'Subtitle': 'Tommorrow Is My Birthday'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryWhiteColor,
      key: _scaffoldKey,
      drawer: DrawerMenu(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.notes, color: kPrimaryGreyColor),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        leadingWidth: 70,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 80.0),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              width: 80,
              height: 60,
            ),
          ),
          IconButton(
            icon: Icon(Icons.qr_code_scanner, color: kPrimaryGreyColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: kPrimaryGreyColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: kPrimaryWhiteColor,
        elevation: 0,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          // ignore: deprecated_member_use
          overscroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 14,
                    color: kPrimaryGreyColor,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "New Messages",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: screenHeight * 0.35,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: ListView.builder(
                              itemCount: newmessage.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(newmessage[index]["email"]);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => chatpage(
                                                email: newmessage[index]
                                                    ["email"].toString(),
                                              )),
                                    );
                                  },
                                  child: cardView(
                                      newmessage[index]["Picture"],
                                      newmessage[index]["Title"],
                                      newmessage[index]["Subtitle"]),
                                );
                              }),
                        ),
                      ),
                      Text(
                        "Old Messages",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: screenHeight * 0.4,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: ListView.builder(
                              itemCount: oldmessage.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: cardView(
                                      oldmessage[index]["Picture"],
                                      oldmessage[index]["Title"],
                                      oldmessage[index]["Subtitle"]),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
