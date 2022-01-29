import 'package:cameratest/direct_message_page.dart';
import 'package:cameratest/notification_page.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home", style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => NotificationPage()));
          }, icon: const Icon(Icons.notifications, color: greyColor,)),

          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => DirectMessagePage()));
          }, icon: const Icon(Icons.send, color: greyColor))
        ],
      ),
    );
  }
}
