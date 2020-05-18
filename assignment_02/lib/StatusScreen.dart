import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
          child: StatusListView(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.edit),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(height: 15),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.camera_alt),
                    backgroundColor: Colors.green,
                  )
                ],
              ),
            )
        )
    );
  }
}

class StatusListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // backing data
    final groups = [
      new StatusItem("Member 1", "Updated 13 hours ago", Icons.ac_unit),
      new StatusItem("Member 2", "9:47 PM", Icons.cloud_circle),
      new StatusItem(
          "Member 3", "Updated 2 hours ago", Icons.chrome_reader_mode),
    ];

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            groups[index].memberName,
            style: TextStyle(color: Colors.blueAccent),
          ),
          subtitle: Text(groups[index].lastStatusUpdate),
          leading: Icon(
            groups[index].memberIcon,
            size: 50,
            color: Colors.green,
          ),
        );
      },
    );
  } //Widget
}

class StatusItem {
  String memberName;
  String lastStatusUpdate;
  IconData memberIcon;

  StatusItem(String memberName, String lastStatusUpdate, IconData memberIcon) {
    this.memberName = memberName;
    this.lastStatusUpdate = lastStatusUpdate;

    this.memberIcon = memberIcon;
  }
}
