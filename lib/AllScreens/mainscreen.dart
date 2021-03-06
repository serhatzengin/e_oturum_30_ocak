import 'package:e_oturum_30_ocak/AllScreens/loginscreen.dart';
import 'package:e_oturum_30_ocak/common_widget/social_login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*  login ekranını yapmaya devam et 7. videodayım */
class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

     return  MaterialApp(
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: Scaffold(
        key: scaffoldKey,
        drawer: new Drawer(
          child: new ListView(),
        ),
        body: Stack(
          children: <Widget>[
            new Center(
                child: new Column(
              children: <Widget>[],
            )),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   key: _scaffoldKey,
    //   // appBar: AppBar(
    //   //   title: Text('Drawer'),
    //   // ),
    //   drawer: Drawer(
    //     child: ListView(
    //       children: <Widget>[
    //         DrawerHeader(child: Text('Canım Drawerim')),
    //         SocialLoginButton(
    //           butonText: "Çıkış Yap",
    //           butonColor: Color(0xffffffff),
    //           textColor: Color(0xff868686),
    //           onPressed: () {
    //             FirebaseAuth.instance.signOut();
    //             Navigator.pushNamedAndRemoveUntil(
    //                 context, LoginScreen.idScreen, (route) => false);
    //           },
    //           //butonIcon: Image.asset("images/facebook.png", width: 10),
    //           butongenislik: 350,
    //           butonyukseklik: 44,
    //         ),
    //         SizedBox(height: 10),
    //         GestureDetector(
    //           onTap: () {
    //             FirebaseAuth.instance.signOut();
    //             Navigator.pushNamedAndRemoveUntil(
    //                 context, LoginScreen.idScreen, (route) => false);
    //           },
    //           child: ListTile(
    //             title: Text('Deneme'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: Scaffold(
        key: scaffoldKey,
        drawer: new Drawer(
          child: new ListView(),
        ),
        body: Stack(
          children: <Widget>[
            new Center(
                child: new Column(
              children: <Widget>[],
            )),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
