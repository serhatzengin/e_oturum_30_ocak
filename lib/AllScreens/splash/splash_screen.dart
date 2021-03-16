import 'package:e_oturum_30_ocak/AllScreens/splash/components/body.dart';
import 'package:flutter/material.dart';

import 'package:e_oturum_30_ocak/size_config.dart';

class SplashScreeen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    /* bu kod satırını en boya göre değer vermek için yazman lazım 
    ekranın boyutlarını okuyan size_config.dart dosyasından değerleri sayfaya girdiğimizde
    okumasını ve ona göre işlem yapmasını sağlar*/
    /*  Scaffold beyaz bir arka planın oluşturulmasını sağlar */
    return Scaffold(
      body: Body(),
    );
  }
}
