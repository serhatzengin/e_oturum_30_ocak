import 'package:e_oturum_30_ocak/AllScreens/loginscreen.dart';
import 'package:e_oturum_30_ocak/AllWidgets/drawer.dart';
import 'package:e_oturum_30_ocak/common_widget/customelisttile.dart';
import 'package:e_oturum_30_ocak/common_widget/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      /*  Drawer'ı başka bir sayfadan çekiyorum */
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
          ),
          Center(child: Text('Home', style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
