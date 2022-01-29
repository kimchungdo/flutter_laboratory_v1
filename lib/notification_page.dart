import 'package:cameratest/color.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  Widget notiItem(String content) => Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Column(
      children: [
        Divider(height: 1, color: greyColor),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: Colors.yellow,),
            SizedBox(width: 10),
            Text("$content"),
          ],
        ),
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("알림장"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          notiItem("김청도님이 좋아요를 누르며 비웃습니다"),
          notiItem("김청도님이 회원님의 게시글을 고소하였습니다"),
          notiItem("김청도님이 디엠을 보냈습니다")
        ],
      ),
    );
  }
}
