// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/parts/drawer.dart';
import 'package:flutter_application_1/view/Message.dart/chatScreen.dart';

class MessageScrren extends StatefulWidget {
  const MessageScrren({Key? key}) : super(key: key);

  @override
  State<MessageScrren> createState() => _Home1State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _Home1State extends State<MessageScrren> {
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
                            child: Chats(),
                          ),
                        ),
                        // Text(
                        //   "Old Messages",
                        //   style: TextStyle(
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w600,
                        //       color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}



class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  void callChatDetailScreen(BuildContext context, String name, String uid) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) =>
                ChatDetail(friendUid: uid, friendName: name)));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            
           .where('uid', isNotEqualTo: "002" )
          //   .orderBy("createdOn", descending: true)
           //  .where("createdOn", isEqualTo: "May 4, 2022 at 12:00:00 AM UTC+5:30" )
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                // CupertinoSliverNavigationBar(
                //   largeTitle: Text("Poples Chat"),
                // ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic>? data =
                          document.data() as Map<String, dynamic>?;
                      return Card(
                        child: ListTile(
                          onTap: () => callChatDetailScreen(
                              context, data!['name'], data['uid']),
                          leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/lonewolf.png'),
                              minRadius: 30,
                              backgroundColor: Colors.transparent,
                              maxRadius: 30),
                          title: Text(data!['name']),
                          subtitle: Text(data['status']),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            );
          }
          return Container(
            height: 900,
          );
        });
  }
}
