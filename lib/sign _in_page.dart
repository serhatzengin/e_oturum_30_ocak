import 'package:flutter/material.dart';
import 'package:e_oturum_30_ocak/common_widget/social_login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  final Function(User) onSignIn;

  const SignInPage({Key key, @required this.onSignIn}) : super(key: key);

  void _misafirGirisi() async {
    /* AuthResult sonuc = await FirebaseAuth.instance.signInAnonymously();*/
    UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
/*FirebaseUser has been changed to User

AuthResult has been changed to UserCredential

GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()

onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()

currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>
   */
    print("Oturum açan user id" + sonuc.user.uid.toString());
    //anonim girme çalışmıyor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serhat"),
        elevation: 0, /*gölgeyi kaldırıyor*/
      ),
      backgroundColor: Colors.grey.shade200,
      /*arkaplana beyazımsı arkaplan atıyor*/
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        /*kenarlardan tüm continerı öteliyor*/
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          /*soldan sağa boyutunu ayarlarmak
          için kullanıyoruz sütunda ana eksen sütundur cross axişs ile bunu tersliyoruz. 
          sütunda satırı kontrol ediyoruz*/
          mainAxisAlignment: MainAxisAlignment.center,
          /*Sütun tanımladığımızda sütunun 
          ana ekseninde kontrol sğlamak için kullanıyoruz*/
          children: <Widget>[
             Text("Dijital Antrenörünüz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  color: Color(0xff4a8e94),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.437,
                )),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              butonText: "Facebook ile Giris Yap",
              butonColor: Color(0xff3b5999),
              textColor: Color(0xffffffff),
              onPressed: () {},
              butonIcon: Image.asset("images/facebook.png", width: 15),
            ),
            SocialLoginButton(
              butonText: "Google ile Giris Yap",
              butonColor: Color(0xffff5847),
              textColor: Color(0xffffffff),
              onPressed: () {},
              butonIcon: Image.asset("images/google.png", width: 15),
              paddingl: 30,
            ),
            SocialLoginButton(
              butonText: "E-Posta ile Giriş Yap",
              butonColor: Color(0xffffffff),
              textColor: Color(0xff4a8e94),
              onPressed: () {},
              butonIcon: Image.asset("images/mail.png", width: 15),
            ),
            SocialLoginButton(
              butonText: "Anonim Giriş",
              butonColor: Color(0xffffffff),
              textColor: Color(0xff4a8e94),
              onPressed: _misafirGirisi,
              //butonIcon: Image.asset("images/mail.png", width: 15),
            ),
          ],
        ),
      ),
    );
  }
}
