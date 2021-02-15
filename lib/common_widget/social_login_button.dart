import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String butonText;
  final Color butonColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  final double genislik;
  final Widget butonIcon;
  final VoidCallback onPressed;
  final double punta;
  final double paddingl;
  final double paddingr;
  final double paddingt;
  final double paddingb;
  final double ilkgenislik;
  final double ikincigenislik;
  final double ucuncugenislik;

  /*  tanımlamaları yaptıktan sonra yazığın tanımlamaları tara ve 
  çıkan seçeneğe tıkla böylece nesne olarka kullanmamızı sağlayacak yapı ortaya çıkacaktır. 
  */
  const SocialLoginButton({
    /*buralara eğer değer vermezsek varsayılan olarak 
    değer çekmesini sağlayabiliriz. Bu değerleri girerek belirtiyoruz  */
    Key key,
    @required this.butonText,
    this.butonColor: Colors.red,
    this.textColor: Colors.white,
    this.radius: 6,
    this.yukseklik: 44,
    this.onPressed,
    this.punta: 15,
    this.butonIcon,
    this.paddingl: 0,
    this.paddingr: 0,
    this.paddingt: 0,
    this.paddingb: 0,
    this.genislik: 0,
    this.ilkgenislik: 0,
    this.ikincigenislik: 0, this.ucuncugenislik,
  })  : assert(butonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 15),
      child: SizedBox(
        /* burada sized box ile sarmamızın nedeni risedbuttonun 
      butonun kendinden getirdiği çevresine bıraktırdığı otomatik
      boşluk özelliğini kaldırmaktır.  */
        // width: genislik,
        //height: yukseklik,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: radius,
            primary: butonColor,
          ),
          //style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red) ),
          child: Padding(
            padding: EdgeInsets.only(
              left: paddingl,
              right: paddingr,
              top: paddingt,
              bottom: paddingb,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: ilkgenislik,
                ),
                butonIcon != null ? butonIcon : Container(),
                SizedBox(
                  width: ikincigenislik,
                ),
                /* eğer Spread cllection if kavramını uygulamak istiyorsan
                224. videoyu izle  */
                /*burada ıconu kapamın nedeni devasa boyutlara ulaşmasıdır. 
                içerisine ekstra bir container tanımlamıyorum fakar ıcon boyutunu ayarlayamazsam 
                container koyacağım */
                Text(
                  butonText,
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    color: textColor,
                    fontSize: punta,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  width: ikincigenislik,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*   yapılacaklar  buton kütüprhanemi değiştireceğim sized box yapacağım. paddin padding olmaycak sadece 
sized box yapacağım. */