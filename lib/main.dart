import 'package:cameratest/shortform_page.dart';
import 'package:flutter/material.dart';

import 'camera_page.dart';
import 'color.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Camera test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CameraExample()));
        },
        tooltip: 'camera',
        child: const Icon(Icons.camera),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
        selectedItemColor: coolGreenColor,
        unselectedItemColor: _selectedIndex == 0? Colors.white: greyColor.withOpacity(.60),//Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap:(int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.space_dashboard), label: 'ShortForm'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'HOME'),
        BottomNavigationBarItem(icon: Icon(Icons.attractions), label: 'Leaderboards'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
      ],

      ),
    );
  }
  final List _widgetOptions = [
    const ShortFormPage(),

    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'dont click Floating Action Button to Activate Camera',
          ),
        ],
      ),
    ),

    const HomePage(),

    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'dont click Floating Action Button to Activate Camera',
          ),
        ],
      ),
    ),

    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'dont click Floating Action Button to Activate Camera',
          ),
        ],
      ),
    ),

  ];
}


