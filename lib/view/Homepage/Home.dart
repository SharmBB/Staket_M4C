// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/parts/drawer.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool loaderRoutes = false;
  String qrCode = '';

  @override
  void initState() {
    super.initState();
  }

  List datas = [
    {
      "Name": "BLK MKT -MacFlurry",
      "Status": "2 min ago",
      "Image": "Assets/wolf.jpg",
      "Image2": "Assets/lonewolf.png",
      "Potency": "Very Stong",
      "Thc": "20.00-27.00",
      "Cbd": "20.00-27.00 ",
      "PlantType": "Hybrid",
      "Terpenes": "Caryophyliene",
      "Craft": "Yes",
      "GrowingRegion": "Okanagan",
      "GrowMethod": "Indoor",
      "DryingMethod": "HangDry"
    }
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
                'assets/lonewolf.png',
                fit: BoxFit.cover,
                width: 50,
                height: 30,
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
        body: SingleChildScrollView(
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
                        "What's up Bud ?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * (0.25 / 20)),
                      Text(
                        "Scan your Product",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 80.0)),
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color: kPrimaryGreenColor,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            SizedBox(height: screenHeight * (1.5 / 20)),
                            Text(
                              "Scan QR Code",
                              style: TextStyle(
                                fontSize: 16,
                                //  fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),

                            Container(
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  itemCount: datas.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Favourite Item",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                  "See All",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.green),
                                                ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  datas[index]["Name"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  datas[index]["Status"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 145,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors.white),
                                                  child: Image.asset(
                                                    "assets/lonewolf.png",
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                ),
                                                // TextButton(
                                                //     onPressed: () {},
                                                //     child: Text(
                                                //       "Find More",
                                                //       style: TextStyle(
                                                //           fontSize: 15,
                                                //           fontWeight: FontWeight.w400,
                                                //           color: Colors.green),
                                                //     ))
                                              ],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                                height: 180,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.grey[200]),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    //1
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "POTENCY",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors.white,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "Potency"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),

                                                    //2
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color:
                                                              Colors.grey[200],
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "THC",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors
                                                                .grey[200],
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        ["Thc"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    //3

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "CBD",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors.white,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        ["Thc"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),

                                                    //4
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color:
                                                              Colors.grey[200],
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "PLANT TYPE",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors
                                                                .grey[200],
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "PlantType"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),

                                                    //5
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "TERPENES",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors.white,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "Terpenes"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    //6
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color:
                                                              Colors.grey[200],
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "CRAFT",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors
                                                                .grey[200],
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "Craft"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    //7
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "GROWING REGION",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors.white,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "GrowingRegion"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),

                                                    // SizedBox(
                                                    //   height: 8,
                                                    // ),
                                                    //8
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color:
                                                              Colors.grey[200],
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "GROW METHOD",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors
                                                                .grey[200],
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "GrowMethod"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    //
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 110,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        6),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "DRYING METHOD",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .question_mark,
                                                                  size: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 20,
                                                            width: 85,
                                                            color: Colors.white,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          6),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    datas[index]
                                                                        [
                                                                        "DryingMethod"],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "What Have Others \n Bought Along with This ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    " See All ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            //Product List
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 230,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 160.0,
                                      child: Card(
                                      //  color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          },
                                          child: Wrap(
                                            children: [
                                              Image.asset(
                                                  'assets/lonewolf.png'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0, left: 30),
                                                child: ListTile(
                                                    title: Text('Product',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                primaryColor))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    
                                  }),
                            ),
                                //Product List
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 230,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 160.0,
                                      child: Card(
                                      //  color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          },
                                          child: Wrap(
                                            children: [
                                              Image.asset(
                                                  'assets/lonewolf.png'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0, left: 30),
                                                child: ListTile(
                                                    title: Text('Product',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                primaryColor))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                            
                                   })),
                                     Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "What Have Others \n Bought From  This Store ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    " See All ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.green[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            //Product List
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 230,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 160.0,
                                      child: Card(
                                      //  color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          },
                                          child: Wrap(
                                            children: [
                                              Image.asset(
                                                  'assets/lonewolf.png'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0, left: 30),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                        title: Text('Product',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    primaryColor))),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    
                                  }),
                            ),
                                //Product List
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 230,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 9,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 160.0,
                                      child: Card(
                                      //  color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ),
                                            );
                                          },
                                          child: Wrap(
                                            children: [
                                              Image.asset(
                                                  'assets/lonewolf.png'),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0, left: 30),
                                                child: ListTile(
                                                    title: Text('Product',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                primaryColor))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                            
                                   }))
                                   
                                    ],
                        ),
                      ),
                    ]))));
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
