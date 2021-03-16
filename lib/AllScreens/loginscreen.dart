import 'package:e_oturum_30_ocak/AllScreens/registerationScreen.dart';

import 'package:e_oturum_30_ocak/common_widget/dialog.dart';
import 'package:e_oturum_30_ocak/common_widget/social_login_button.dart';
import 'package:e_oturum_30_ocak/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'mainscreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Login'),),

      body: SingleChildScrollView(
        // color: Colors.white,
        padding: EdgeInsets.all(16.0),

        child: Column(
          // mainAxisSize: MainAxisSize.max,

          /*soldan sağa boyutunu ayarlarmak
          için kullanıyoruz sütunda ana eksen sütundur cross axişs ile bunu tersliyoruz. 
          sütunda satırı kontrol ediyoruz*/
          mainAxisAlignment: MainAxisAlignment.start,

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
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 15.0),
                /* girilen e posta adresinin font boyutu  */
                decoration: InputDecoration(
                    hintText: 'E Postanızı Giriniz',
                    /* alan boş olduğu zaman yazacak yaz */
                    labelStyle: TextStyle(
                      color: Color(0xff868686),
                      fontSize: 14,
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xff868686),
                      fontSize: 15,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: passwordTextEditingController,
                  obscureText: true,
                  /*  şifrenin görünmez şekilde yazılmasını sağlar */
                  style: TextStyle(fontSize: 15.0),
                  /* girilen e posta adresinin font boyutu  */
                  decoration: InputDecoration(
                      hintText: 'Şifrenizi Giriniz',
                      /* alan boş olduğu zaman yazacak yaz */
                      labelStyle: TextStyle(
                        color: Color(0xff868686),
                        fontSize: 14,
                      ),
                      hintStyle: TextStyle(
                        color: Color(0xff868686),
                        fontSize: 15,
                      ))),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SocialLoginButton(
                  butonText: "E-Posta ile Giriş Yap",
                  butonIcon: Image.asset("images/mail.png", width: 17),
                  butonColor: Color(0xffffffff),
                  textColor: Color(0xff868686),
                  onPressed: () {
                    if (!emailTextEditingController.text.contains("@")) {
                      print("email geçerli değil");
                      displayToastMessage(
                          "Email adress geçerli değil", context);
                    } else if (passwordTextEditingController.text.isEmpty) {
                      displayToastMessage(" Şifere Sağlayın", context);
                    } else {
                      loginAndAuthenticateUser(context);
                    }
                  },
                  ikincigenislik: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("veya",
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  color: Color(0xffe4e4e4),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.19,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
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
            SizedBox(
              height: 10,
            ),
            Text("Hesap Oluştur",
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  color: Color(0xff868686),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.285,
                )),
            SocialLoginButton(
              butonText: "Hesabınız Yok Mu? Kaydolun!",
              butonColor: Color(0xffffffff),
              textColor: Color(0xff868686),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RegisterationScreen.idScreen, (route) => false);
              },
              //butonIcon: Image.asset("images/facebook.png", width: 10),
              butongenislik: 250,
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return ProgressDialog(
    //       message: "Giriş yapılıyor ",
    //     );
    //   },
    // );

    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      //displayToastMessage("Hata" + errMsg.toString(), context);
      showDialog(
          context: context, builder: (BuildContext context) => CustomDialog());
    }))
        .user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then(
        (DataSnapshot snap) {
          if (snap.value != null) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.idScreen, (route) => false);

            displayToastMessage("Giriş Yaptınız!", context);
          } else {
            _firebaseAuth.signOut();
            showDialog(
          context: context, builder: (BuildContext context) => CustomDialog());
          /* kendi kütüphanemi içeren mesajı göstermek için bu ko */
            // displayToastMessage(
            //     "Kullanıcı için kayıt bulunamadı üyelik oluşturun!", context);

            /* displayToastMessage kodu da bildirim göstemektedir. 
            bildirimini kapadım onun yerine  */
          }
        },
      );
    } else {
//error occured - display error msg
      Navigator.pop(context);

      displayToastMessage("Hata meydana geldi, giriş yapılamadı", context);
    }
  }
}
