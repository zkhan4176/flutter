import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatefulWidget {
  final int data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context , constraints) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 0, //means there is no Expanded
              child: Container(
                 width: constraints.maxWidth * 0.60,
                child: FittedBox(
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                   // backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10/*, child: Container(color: Colors.blueGrey,),*/),

            Expanded(
              flex: 0, //means there is no Expanded
              child: Container(
                width: constraints.maxWidth * 0.40,
                height: 50,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Venture Dive" , style: TextStyle( backgroundColor: Colors.white,  ),),
                  ),
                ),

              ),
            ),
            Expanded(
              flex: 0, //means there is no Expanded
              child: Container(
              //  width: constraints.maxWidth * 0.20,
                height: 50,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(widget.data.toString() , style: TextStyle( backgroundColor: Colors.white,  ),),
                  ),
                ),

              ),
            ),
          ],
        ),
      );
    },
  );
}
