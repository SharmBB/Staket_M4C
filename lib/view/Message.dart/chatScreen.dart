// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';

class ChatDetail extends StatefulWidget {
  final friendUid;
  final friendName;

  ChatDetail({Key? key, this.friendUid, this.friendName}) : super(key: key);

  @override
  _ChatDetailState createState() => _ChatDetailState(friendUid, friendName);
}

class _ChatDetailState extends State<ChatDetail> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final friendUid;
  final friendName;
  final currentUserId = "002";
  var chatDocId;
  var _textController = new TextEditingController();
  _ChatDetailState(this.friendUid, this.friendName);
  @override
  void initState() {
    super.initState();
    print(friendName);
    print(friendUid);
    checkUser();
  }

  void checkUser() async {
    await chats
        .where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
              });

              print(chatDocId);
            } else {
              await chats.add({
                'users': {currentUserId: null, friendUid: null}
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'msg': msg
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chats
          .doc(chatDocId)
          .collection('messages')
          .orderBy('createdOn', descending: true)
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
          var data;
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(friendName),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Icon(CupertinoIcons.phone),
              ),
              previousPageTitle: "Back",
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      reverse: true,
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          data = document.data()!;
                          print(document.toString());
                          print(data['msg']);
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ChatBubble(
                              clipper: ChatBubbleClipper6(
                                nipSize: 0,
                                radius: 20,
                                type: isSender(data['uid'].toString())
                                    ? BubbleType.sendBubble
                                    : BubbleType.receiverBubble,
                              ),
                              alignment: getAlignment(data['uid'].toString()),
                              margin: EdgeInsets.only(top: 20),
                              backGroundColor: isSender(data['uid'].toString())
                                  ? Color(0xFF08C187)
                                  : Color(0xffE7E7ED),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(data['msg'],
                                            style: TextStyle(
                                                decoration: TextDecoration.none,
                                                fontSize: 16,
                                                color: isSender(
                                                        data['uid'].toString())
                                                    ? Colors.white
                                                    : Colors.black),
                                            maxLines: 100,
                                            overflow: TextOverflow.ellipsis)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          data['createdOn'] == null
                                              ? DateTime.now().toString()
                                              : data['createdOn']
                                                  .toDate()
                                                  .toString(),
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 10,
                                              color: isSender(
                                                      data['uid'].toString())
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: CupertinoTextField(
                            controller: _textController,
                          ),
                        ),
                      ),
                      CupertinoButton(
                          child: Icon(Icons.send_sharp),
                          onPressed: () => sendMessage(_textController.text))
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
