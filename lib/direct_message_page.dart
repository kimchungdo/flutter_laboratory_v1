import 'package:cameratest/color.dart';
import 'package:flutter/material.dart';

class DirectMessagePage extends StatefulWidget {
  const DirectMessagePage({Key? key}) : super(key: key);

  @override
  _DirectMessagePageState createState() => _DirectMessagePageState();
}

class _DirectMessagePageState extends State<DirectMessagePage> {

  Widget buildDMItem() => Container(
    child: Column(
      children: [
        Divider(height: 1, color: greyColor),
        //Row
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("디엠장"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
