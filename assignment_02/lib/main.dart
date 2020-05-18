// Replace the code in main.dart with the following.

import 'package:flutter/material.dart';
import 'package:ui/CallsScreen.dart';
import 'package:ui/ChatScreen.dart';
import 'package:ui/StatusScreen.dart';

void main() {
  runApp(new MockWhatsApp());
}

class MockWhatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Assigment2",
        home: DefaultTabController(length: 4, child: new MainScreen()));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.camera_alt,
              ),
            ),
            Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CALLS"),
          ],
        ),
        title: Text('WhatsApp'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: TabBarView(
        children: [
          Icon(
            Icons.brightness_4,
            size: 170,
          ),
          Container(child: new ChatScreen()),
          Container(child: new StatusScreen()),
          Container(child: new CallsScreen()),
        ],
      ),
    );
  }
}
