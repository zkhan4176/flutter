import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'DetailWidget.dart';
import 'ListWidget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedValue = 0;
  var showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        orientation == Orientation.landscape
            ? showDetail = true
            : showDetail = false;

        return Row(children: <Widget>[
          Expanded(
            child: ListWidget(10, (value) {
              if (showDetail) {
                selectedValue = value;
                setState(() {});
              } else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(value);
                  },
                )
                );
              }
            }
            ),
          ),
          showDetail
              ? Expanded(child: DetailWidget(selectedValue))
              : Container(),
        ]);
      }),
    );
  }
}
