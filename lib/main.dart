import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pages/HomePage.dart';
import 'pages/SavedPassWordsPage.dart';
import 'pages/EncryptionPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('myBox');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottomTabBar(),
    );
  }
}

class bottomTabBar extends StatefulWidget {
  const bottomTabBar({Key? key}) : super(key: key);
  @override
  State<bottomTabBar> createState() => _bottomTabBarState();
}

class _bottomTabBarState extends State<bottomTabBar> {

  int _index = 0;
  final pages = [
    HomePage(),
    SavedPassWordsPage(),
    EncryptionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      backgroundColor: Colors.black87,
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        onTap: (value){
          setState(() {
            _index = value;
          });
        },

        backgroundColor: Colors.grey.shade900,
        color: Colors.black87,
        animationDuration: Duration(milliseconds: 300),
        items: [
          Icon(Icons.home, color: Colors.grey[300],),
          Icon(Icons.key_outlined, color: Colors.grey[300],),
          Icon(Icons.account_balance_outlined, color: Colors.grey[300],),
        ],
      ),
    );
  }
}

