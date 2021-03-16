import 'package:e_oturum_30_ocak/AllScreens/loginscreen.dart';

import 'package:e_oturum_30_ocak/AllScreens/mainscreen.dart';
import 'package:e_oturum_30_ocak/common_widget/dialog.dart';
import 'package:e_oturum_30_ocak/common_widget/social_login_button.dart';
import 'package:e_oturum_30_ocak/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
              child: Image(
                image: AssetImage("images/logo.png"),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              controller: nameTextEditingController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15.0),
              /* girilen e posta adresinin font boyutu  */
              decoration: InputDecoration(
                  hintText: 'İsim ve Soyisminizi Giriniz',
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
                      /* alan boş olduğu zaman yazacak yazı */
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
            TextField(
                obscureText: true,
                /*  şifrenin görünmez şekilde yazılmasını sağlar */
                style: TextStyle(fontSize: 15.0),
                /* girilen e posta adresinin font boyutu  */
                decoration: InputDecoration(
                    hintText: 'Şifrenizi Tekrar Giriniz',
                    /* alan boş olduğu zaman yazacak yaz */
                    labelStyle: TextStyle(
                      color: Color(0xff868686),
                      fontSize: 14,
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xff868686),
                      fontSize: 15,
                    ))),
            SizedBox(height: 10),
            SocialLoginButton(
              butonText: "Hesap Oluşturun",
              butonColor: Color(0xffffffff),
              textColor: Color(0xff868686),
              onPressed: () {
                if (nameTextEditingController.text.length < 3) {
                  displayToastMessage(
                      "isim En Az 3 Karakter Olmalıdır!", context);
                } else if (!emailTextEditingController.text.contains("@")) {
                  displayToastMessage("Email adress geçerli değil", context);
                } else if (passwordTextEditingController.text.length < 6) {
                  print("Şifre kısa");
                  // displayToastMessage(" Şifre 6 karakterli olmalıdır", context);
                } else {
                  registerNewUser(context);
                }
              },
              //butonIcon: Image.asset("images/facebook.png", width: 10),
              butongenislik: 350,
              butonyukseklik: 44,
            ),
            SizedBox(height: 10),
            SocialLoginButton(
              butonText: "Hesabınız Var Mı? Giriş Yapın!",
              butonColor: Color(0xffffffff),
              textColor: Color(0xff868686),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.idScreen, (route) => false);
              },
              //butonIcon: Image.asset("images/facebook.png", width: 10),
              butongenislik: 350,
              butonyukseklik: 44,
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return ProgressDialog(
    //       message: "Kayıt Yapılıyor ",
    //     );
    //   },
    // );
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text,
      password: passwordTextEditingController.text,
    )
            .catchError((errMsg) {
      
     // displayToastMessage("Hata" + errMsg.toString(), context);
     showDialog(context: context, builder: (BuildContext context) => CustomDialog()); 
    }))
        .user;

    if (firebaseUser != null) //user created
    {
//save user info to database

      Map userDataMap = {
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
      };

      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          "Tebrikler Hesabınız  başarılı şekilde oluşturuldu", context);
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      _firebaseAuth.signOut();
    //  Navigator.pop(context);
//error occured - display error msg
      displayToastMessage("Kullanıcı bulunamadı,üyelik oluşturun ", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
