import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/_helpers/parts/drawer.dart';
import 'package:flutter_application_1/view/Homepage/Home.dart';

import 'Message.dart';

class chatpage extends StatefulWidget {
  String email;
  chatpage({
    required this.email,
  });
  @override
  _chatpageState createState() => _chatpageState(email: email);
}

class _chatpageState extends State<chatpage> {
  String email;
  _chatpageState({required this.email});

  final fs = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    email = widget.email;
    print(email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Message",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Back to Messages",
                    style: TextStyle(
                      fontSize: 15,
                      color: kPrimaryGreyColor,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(
                email: email,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kPrimaryGreenColor,
                      hintText: 'Type Message ...',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: new BorderSide(color:kPrimaryGreenColor),
                      //   borderRadius: new BorderRadius.circular(30),
                      // ),
                      // enabledBorder: UnderlineInputBorder(
                      //   borderSide: new BorderSide(color: Colors.purple),
                      //   borderRadius: new BorderRadius.circular(10),
                      // ),
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages').doc().set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'email': email,
                      });

                      message.clear();
                    }
                  },
                  icon: Icon(Icons.send_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
