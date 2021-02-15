import 'package:e_oturum_30_ocak/common_widget/dialog.dart';
import 'package:e_oturum_30_ocak/common_widget/dialog_v2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_oturum_30_ocak/src/screens/home.dart';
import 'package:e_oturum_30_ocak/common_widget/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Login'),),

      body: SingleChildScrollView(
        // color: Colors.white,
        padding: EdgeInsets.all(16.0),
        /*kenarlardan tüm continerı öteliyor*/

        child: Column(
          // mainAxisSize: MainAxisSize.max,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          /*soldan sağa boyutunu ayarlarmak
          için kullanıyoruz sütunda ana eksen sütundur cross axişs ile bunu tersliyoruz. 
          sütunda satırı kontrol ediyoruz*/
          mainAxisAlignment: MainAxisAlignment.start,
          /*Sütun tanımladığımızda sütunun 
          ana ekseninde kontrol sğlamak için kullanıyoruz*/
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Container(
              width: 150,
              height: 138.5,
              // decoration: new BoxDecoration(color: Color(0xffff7fff)),
              child: new Image(
                image: AssetImage("images/logo.png"),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'E Postanızı Giriniz'),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Paralanızı Giriniz'),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SocialLoginButton(
                  //color: Theme.of(context).accentColor,
                  butonText: "E-Posta ile Giriş Yap",
                  butonIcon: Image.asset("images/mail.png", width: 17),
                  butonColor: Color(0xffffffff),
                  textColor: Color(0xff868686),
                  onPressed: () {
                    auth
                        .signInWithEmailAndPassword(
                            email: _email, password: _password)
                        .then((_) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    });
                  },
                  ikincigenislik: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                SocialLoginButton(
                  //color: Theme.of(context).accentColor,
                  butonText: "E-Posta ile Kaydol",
                  butonIcon: Image.asset("images/mail.png", width: 17),

                  butonColor: Color(0xffffffff),
                  textColor: Color(0xff868686),

                  onPressed: () {
                    auth
                        .createUserWithEmailAndPassword(
                            email: _email, password: _password)
                        .then((_) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    });
                  },
                  ikincigenislik: 10,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              //crossAxisAlignment: CrossAxisAlignment.stretch,

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SocialLoginButton(
                  butonText: "Giriş Yap",
                  butonColor: Color(0xff3b5999),
                  textColor: Color(0xffffffff),
                  onPressed: () {},
                  butonIcon: Image.asset("images/facebook.png", width: 10),
                  ilkgenislik: 10,
                  ikincigenislik: 10,
                  ucuncugenislik: 5,
                ),
                SocialLoginButton(
                  butonText: " Giriş Yap",
                  butonColor: Color(0xffff5847),
                  textColor: Color(0xffffffff),
                  onPressed: () {
                   
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         title: Text("Topic"),
                    //         content: Text("Dialog Content"),
                    //         actions: <Widget>[
                    //           ElevatedButton(
                    //             onPressed: () {
                    //               Navigator.of(context).pop();
                    //             },
                    //             child: Text("Close"),
                    //           ),
                    //         ],
                    //       );
                    //     });

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog());
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) =>
                    //         _showFancyCustomDialog());

                    /* fancy dialog üzerine tıkldaığımda lamba çıkıyor. lambanın ilk seçeneği ne araştır   */
                  },
                  butonIcon: Image.asset("images/google.png", width: 15),
                  ikincigenislik: 10,
                  ucuncugenislik: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

