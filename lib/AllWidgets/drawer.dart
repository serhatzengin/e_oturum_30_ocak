import 'package:e_oturum_30_ocak/AllScreens/loginscreen.dart';
import 'package:e_oturum_30_ocak/common_widget/customelisttile.dart';
import 'package:e_oturum_30_ocak/common_widget/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  
  Widget build(BuildContext context) {
    return Drawer(
      key: _scaffoldKey,

      child: ListView(
        children: [
          // DrawerHeader(child: Container(color: Colors.red)),
          CustomListTitle(
              icon: Icons.person, text: "Bildirimler", onTap: () {}),
          CustomListTitle(icon: Icons.person, text: "İstatistikler"),
          CustomListTitle(icon: Icons.person, text: "Ayarlar"),
          CustomListTitle(icon: Icons.person, text: "Destek"),
          CustomListTitle(icon: Icons.person, text: "Sık Sorulan Sorular"),
          CustomListTitle(icon: Icons.person, text: "Tavsiye Et"),
          CustomListTitle(icon: Icons.person, text: "Arkadaşını Ekle"),
          CustomListTitle(icon: Icons.person, text: "Premiuma Geç"),
          CustomListTitle(
              icon: Icons.person,
              text: "Çıkış Yap :(",
              butonColor: Color(0xffb00000),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.idScreen, (route) => false);
              }),
          RoundedButton(
            text: "SIGNUP",
            press: () {},
          ),
        ],
      ),
    );
  }
}
