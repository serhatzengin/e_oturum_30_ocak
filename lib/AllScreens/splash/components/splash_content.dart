import 'package:flutter/material.dart';


import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  /* yukarıda kullandığımız Column'un buraya aktarılması için Column sağ tıkla
  extract widget de isim ver bu aşağıdaki yapıyı oluştur. 
  String tanımlamaları sonra yapıldı
   */
  final String text1, image, text2;
  const SplashContent({
    Key key,
    this.image,
    this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'images/logo/dslogo.png',
          height: getProportionateScreenHeight(80),
          width: getProportionateScreenWidth(80),
        ),
        Image.asset(
          //'assets/logo/Splash1.png'
          image,
          height: getProportionateScreenHeight(246),
          width: getProportionateScreenWidth(246),
        ),
        SizedBox(height: getProportionateScreenHeight(50)),
        Text(text1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'ProximaNova',
              color: Color(0xff868686),
              fontSize: getProportionateScreenHeight(23),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              letterSpacing: 1,
            )),
        SizedBox(height: getProportionateScreenHeight(50)),
        Text(text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'ProximaNova',
              color: Color(0xff868686),
              fontSize: getProportionateScreenHeight(15),
              fontWeight: FontWeight.w400,
            ))
      ],
    );
  }
}
