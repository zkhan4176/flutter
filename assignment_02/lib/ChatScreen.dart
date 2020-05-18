import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(child: ChatListView()),
        floatingActionButton: new FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.message),
          backgroundColor: Colors.green,
          onPressed: () {},
        ));
  }
}

class ChatListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // backing data
    final groups = [
      new GroupItem("Group 1", "Mem1: Hello", "1:07", Icons.ac_unit),
      new GroupItem("Group 3", "Mem2: Hello", "2:01", Icons.cake),
      new GroupItem("Group 2", "Mem1: Hello", "3:07", Icons.snooze, 2),
      new GroupItem("Group 5", "Mem1: Hello", "15:07", Icons.star_half),
      new GroupItem("Group 6", "Mem1: Hello", "11:07", Icons.child_care),
    ];

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(
              groups[index].title,
              style: TextStyle(color: Colors.blueAccent),
            ),
            subtitle: Text(groups[index].lastChat),
            trailing: Column(children: <Widget>[
              Text(
                groups[index].lastChatTime,
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 15),
              if (groups[index].newMessages != null)
                CircleAvatar(
                  child: Text(groups[index].newMessages.toString(),
                      style: TextStyle(color: Colors.white)),
                  maxRadius: 12,
                  backgroundColor: Theme.of(context).backgroundColor,
                )
            ]
            ),
            leading: CircleAvatar(
              child: Icon(
                groups[index].groupIcon,
                size: 25,
                color: Colors.black,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
            )
        );
      },
    );
  } //Widget
}

class GroupItem {
  String title;
  String lastChat;
  String lastChatTime;
  IconData groupIcon;
  int newMessages = 0;

  GroupItem(
      String title, String lastChat, String lastChatTime, IconData groupIcon,
      [int newMessages]) {
    this.title = title;
    this.lastChat = lastChat;
    this.lastChatTime = lastChatTime;
    this.groupIcon = groupIcon;
    this.newMessages = newMessages;
  }
}
