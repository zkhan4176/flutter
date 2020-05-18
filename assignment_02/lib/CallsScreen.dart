import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
          child: CallListView(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.phone),
                backgroundColor: Colors.green,
              ),
            )
        )
    );
  }
}

class CallListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // backing data
    final groups = [
      new CallItem("Member 1", Icons.ac_unit, CallType.Audio, "1:03",
          CallStatus.Incoming),
      new CallItem("Member 2", Icons.cake, CallType.Video, "5:03",
          CallStatus.NotReceived),
      new CallItem(
          "Member 3", Icons.cake, CallType.Audio, "4:00", CallStatus.Missed),
    ];

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            groups[index].name,
            style: TextStyle(color: Colors.blueAccent),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(
                groups[index].getCallStatusIcon(),
                size: 25,
                color: Colors.black,
              ),
              Text(groups[index].callTime),
            ],
          ),
          leading: CircleAvatar(
            child: Icon(
              groups[index].groupIcon,
              size: 25,
              color: Colors.black,
            ),
          ),
          trailing: Icon(
            groups[index].getCallTypeIcon(),
            size: 25,
            color: Colors.black,
          ),
        );
      },
    );
  } //Widget
}

enum CallType { Video, Audio }

enum CallStatus { Outgoing, Incoming, NotReceived, Missed }

class CallItem {
  String name;
  CallType callType;
  String callTime;
  CallStatus callStatus;
  IconData groupIcon;

  CallItem(String name, IconData groupIcon, CallType callType, String callTime,
      CallStatus callStatus) {
    this.name = name;
    this.callType = callType;
    this.callTime = callTime;
    this.callStatus = callStatus;
    this.groupIcon = groupIcon;
  }
  IconData getCallTypeIcon() {
    if (callType == CallType.Audio) {
      return Icons.phone;
    } else if (callType == CallType.Video) {
      return Icons.videocam;
    }
  }

  IconData getCallStatusIcon() {
    if (callStatus == CallStatus.Incoming) {
      return Icons.call_received;
    } else if (callStatus == CallStatus.NotReceived) {
      return Icons.call_missed_outgoing;
    } else if (callStatus == CallStatus.Missed) {
      return Icons.call_missed;
    }
  }
}
