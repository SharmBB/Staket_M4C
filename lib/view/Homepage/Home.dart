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
        body: Container(
            margin: EdgeInsets.only(
              top: 30.0,
              left: 20,
              right: 20.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  ],
                ),
              ),
            ])));
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
