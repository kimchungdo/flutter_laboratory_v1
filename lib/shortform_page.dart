import 'package:cameratest/url_list.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'color.dart';

class ShortFormPage extends StatefulWidget {
  const ShortFormPage({Key? key}) : super(key: key);

  @override
  _ShortFormPageState createState() => _ShortFormPageState();
}

//비디오 컨트롤러 여러개로 두고 할 수 있는 방법 찾아야함..
class _ShortFormPageState extends State<ShortFormPage> {
  VideoPlayerController? _controller;
  VideoPlayerController? _tempController;
  List<String> urls = [video1, video2];
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        video1)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller?.setLooping(true);
    _controller?.setVolume(0.0);
    _controller?.play();
  }
  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  Widget buildShortForm() => Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    child: Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller!.value.size.width,
              height: _controller!.value.size.height,
              child: InkWell(child: VideoPlayer(_controller!), onTap: () => setState(() {
                _controller!.value.isPlaying
                    ? _controller!.pause()
                    : _controller!.play();
              }),),
            ),
          ),
        ),
        Positioned(child: Container(
          child: Column(
            children:  [
              Icon(Icons.favorite_border, size: 30, color: Colors.white),
              Text("223", style: TextStyle(fontSize: 14, color: Colors.white),),
              SizedBox(height: 20),
              InkWell(child: Icon(Icons.message, size: 30, color: Colors.white), onTap: (){
                modalComments();
              },),
              Text("12", style: TextStyle(fontSize: 14, color: Colors.white),),
              SizedBox(height: 25),
              Icon(Icons.send, size: 30, color: Colors.white),
              SizedBox(height: 25),
              Icon(Icons.share, size: 30, color: Colors.white)
            ],
          ),
        ), bottom: 30, right: 20),

        Positioned(child: Container(
          child: Row(
            children: [
              CircleAvatar(backgroundColor: Colors.black, radius: 20,),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Kim Chung-do", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(width: 15,),
                      Container(
                        height: 15,
                        width: 70,
                        child: ElevatedButton(
                          child: const Text('follow', style: TextStyle(fontSize: 10),),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text("#아 #퇴근하고 #싶다", style: TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
        ), bottom: 30, left: 20)
      ],
    ),
  );

  Future<void> modalComments () => showModalBottomSheet(
    context: context,
      isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx){
      return Container(
        height: MediaQuery.of(context).size.height*0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
        child: Column(
          children: const [

          ],
        )
      );
    }
  );

  Future<void> modalSample () => showModalBottomSheet(context: context,
      builder: (ctx){
        return Container(
          height: 150,
          child: Column(
            children: [
              TextButton(
                child: Text("카메라로 촬영하기", ),
                onPressed: (){},
              ),
              Divider(color: lightGreyColor, height: 1, thickness: 1,),
              TextButton(
                child: Text("앨범에서 업로드"),
                onPressed: (){},
              ),
              Divider(color: lightGreyColor, height: 1, thickness: 1,),
            ],
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: modalSample, icon: const Icon(Icons.add_to_photos_outlined))
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          buildShortForm(),
          buildShortForm(),
          buildShortForm(),
          buildShortForm(),
        ],
        onPageChanged: (idx){
          _controller = VideoPlayerController.network(
              urls[idx%2])
            ..initialize().then((_) {
              setState(() {});
            });
          _controller?.setLooping(true);
          _controller?.setVolume(0.0);
          _controller?.play();

        },
      ),
    );
  }
}
