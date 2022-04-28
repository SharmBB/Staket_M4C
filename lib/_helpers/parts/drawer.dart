// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';
import 'package:flutter_application_1/view/Message.dart/chats.dart';
import 'package:flutter_application_1/view/Receipt/Receipts.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.7,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                      width: 90,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            ListTile(
              leading: Icon(Icons.person, color: kPrimaryGreyColor),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryGreyColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.messenger_outline, color: kPrimaryGreyColor),
              title: Text(
                'Message',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryGreyColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessageScrren()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt, color: kPrimaryGreyColor),
              title: Text(
                'Receipt',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryGreyColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReceiptsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.forum_sharp, color: kPrimaryGreyColor),
              title: Text(
                'Forums',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryGreyColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: kPrimaryGreyColor),
              title: Text(
                'Setting',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryGreyColor,
                ),
              ),
              onTap: () async {
                // _handleLogout(context);
              },
            ),
            SizedBox(
              height: height * 0.15,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: kPrimaryGreyColor),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryGreyColor,
                ),
              ),
              onTap: () async {
                // _handleLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }




//   void _handleLogout(BuildContext context) async {
//     try {
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.remove('token');
//       localStorage.remove('userId');
//       print("logged out.");
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => SignIn()));
//     } catch (e) {
//       print(e);
//     }
//   }
// }
}
