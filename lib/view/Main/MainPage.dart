// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/parts/drawer.dart';
import 'package:flutter_application_1/view/Homepage/Home.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool loaderRoutes = false;
  String qrCode = '';

  @override
  void initState() {
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        // ignore: deprecated_member_use
        overscroll.disallowGlow();
        return false;
      },
      child: Scaffold(
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
                width: 90,
                height: 40,
              ),
            ),
            IconButton(
              icon: Icon(Icons.qr_code_scanner, color: kPrimaryGreyColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
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
                  "Hey, Fig Nelson",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: screenHeight * (0.25 / 20)),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 14,
                    color: kPrimaryGreyColor,
                  ),
                ),
                SizedBox(height: screenHeight * (1 / 20)),
                Text(
                  "Current Offers",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: screenWidth,
                  height: screenHeight * (3 / 20),
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: kPrimaryGreenColor,
                    // border: Border.all(color: Colors.red, width: 4.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scan 10 Items by Jan 30th 2022",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * (0.3 / 20)),
                      Text(
                        "If you can 10 items by Jan 30th 2022 you will be",
                        style: TextStyle(
                          fontSize: 13,
                          color: kPrimaryWhiteColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * (0.3 / 20)),
                      Text(
                        "entered into a draw to receive a limited edition NFT",
                        style: TextStyle(
                          fontSize: 13,
                          color: kPrimaryWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prevoius Strains",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        " See All Receipts",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green[600],
                        ),
                      ),
                    ),
                  ],
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
                            child: Wrap(
                              children: [
                                Image.asset('assets/lonewolf.png'),
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0, left: 30),
                                  child: ListTile(
                                      title: Text('Product',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: primaryColor))),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Favourite Item",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                          field[index]
                                                              ['Rating']),
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
                                                                  Radius
                                                                      .circular(
                                                                          8))),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10,
                                                                right: 5,
                                                                top: 5),
                                                        child: Text(
                                                          field[index]
                                                              ['Description'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}