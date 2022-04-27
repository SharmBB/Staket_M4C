// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/parts/drawer.dart';

class ReceiptsScreen extends StatefulWidget {
  const ReceiptsScreen({Key? key}) : super(key: key);

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map> field = [
    {
      'Profile': 'assets/lonewolf.png',
      'Name': 'BLK MKT -MacFlurry',
      'Lastseen': '27 days ago',
      "Rating": '5',
      'Image': 'assets/lonewolf.png',
      'Price': '107.24 / 0.5 oz -7.56/g',
      'Title': "Tokyo Smoke - Bloor Street",
      'Description':
          'This is one of the freshest packs I have opened The burn is great and the high is what is expected  #dopesmoke'
    },
    {
      'Profile': 'assets/lonewolf.png',
      'Name': 'BLK MKT -MacFlurry',
      'Lastseen': '27 days ago',
      "Rating": '3',
      'Image': 'assets/lonewolf.png',
      'Price': '107.24 / 0.5 oz -7.56/g',
      'Title': "Tokyo Smoke - Bloor Street",
      'Description':
          'This is one of the freshest packs I have opened The burn is great and the high is what is expected  #dopesmoke'
    },
    {
      'Profile': 'assets/lonewolf.png',
      'Name': 'BLK MKT -MacFlurry',
      'Lastseen': '27 days ago',
      "Rating": '1',
      'Image': 'assets/lonewolf.png',
      'Price': '107.24 / 0.5 oz -7.56/g',
      'Title': "Tokyo Smoke - Bloor Street",
      'Description':
          'This is one of the freshest packs I have opened The burn is great and the high is what is expected  #dopesmoke'
    },
  ];

  String statusinitvalue = 'Date';
  final statusvalue = [
    'Date',
    'Month',
    'Year',
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
            padding: EdgeInsets.only(right: 80.0),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              width: 80,
              height: 50,
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
          child: Container(
              margin: EdgeInsets.only(
                top: 30.0,
                left: 20,
                right: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Receipts",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * (0.25 / 20)),
                  Text(
                    "Some Great Choices",
                    style: TextStyle(
                      fontSize: 14,
                      color: kPrimaryGreyColor,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        height: 20,
                        width: 100,
                        child: DropdownButton<String>(
                          underline: Container(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          value: statusinitvalue,
                          isExpanded: true,
                          items: statusvalue.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              statusinitvalue = value!;
                            });
                          },
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.7,
                    child: ListView.builder(
                      itemCount: field.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: kPrimaryGreenColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: ExactAssetImage(
                                                    field[index]['Image']),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(field[index]['Profile']),
                                            Row(
                                              children: [
                                                Text(
                                                  field[index]['Lastseen'],
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: 120,
                                                  height: 20,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: int.parse(
                                                        field[index]['Rating']),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Icon(
                                                        Icons.star,
                                                        size: 16,
                                                        color: Colors.amber,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: ExactAssetImage(
                                                    field[index]['Image']),
                                              )),
                                        ),
                                        Column(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(field[index]['Price']),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(field[index]['Title']),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                // const Text("data")
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Container(
                                                    width: screenWidth * 0.55,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8))),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          right: 5,
                                                          top: 5),
                                                      child: Text(
                                                        field[index]
                                                            ['Description'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
