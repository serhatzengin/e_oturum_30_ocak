import 'package:e_oturum_30_ocak/AllScreens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:e_oturum_30_ocak/constant.dart';
import 'package:e_oturum_30_ocak/size_config.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {"text": "EGZERSİZİNİ SEÇ", "image": "images/logo/Splash1.png"},
    {"text": "TELEFONUNU SABİTLE", "image": "images/logo/Splash2.png"},
    {"text": "UYARI", "image": "images/logo/Splash3.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Spacer(),
        SizedBox(height: getProportionateScreenHeight(80)),
        Expanded(
          flex: 4,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) => SplashContent(
              text1: splashData[index]["text"],
              text2:
                  "Senin için hazırladığımız\negzersizlere göz at, sana en\nuygun olanı seç.",
              image: splashData[index]["image"],
            ),
          ),
        ),
        //Spacer(flex: 1),
        //SizedBox(height: getProportionateScreenHeight(50)),
        //SizedBox(child: Container(color: Colors.red),height: 20,),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length,
                  (index) => buildDot(index: index),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  //Navigator.pushNamed(context, SignInScreen.routeName);
                  /*  bu kodu ana koda aktardığında import et  */
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainScreen.idScreen, (route) => false);
                },
                child: Text('Geç'),
                style: TextButton.styleFrom(primary: Color(0xffe4e4e4)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int index}) {
    /*  yazdığımız Container 'a sağ tıklıyoruz sonrasında
    extract method diyoruz isim veriyoruz */
    return AnimatedContainer(
        duration: kAnimationDuration,
        margin: EdgeInsets.only(right: 5),
        width: 7,
        height: currentPage == index ? 20 : 6,
        decoration: new BoxDecoration(
            color: currentPage == index ? Color(0xff4a8e94) : Color(0xffe4e4e4),
            borderRadius: BorderRadius.circular(3.5)));
  }
}

// class StatmentExample extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Text((() {
//       if(currentPage == 3){
//         print("3 Oldu ");}

      
//     })());
//   }
// }

