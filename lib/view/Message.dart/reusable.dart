// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/_helpers/constants.dart';

Widget cardView(imagepath, title, subtitle) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kPrimaryGreenColor,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(imagepath),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}
