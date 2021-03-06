import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final Color butonColor;

  // CustomListTitle(this.icon, this.text, this.onTap);

  const CustomListTitle({
    /*buralara eğer değer vermezsek varsayılan olarak 
    değer çekmesini sağlayabiliriz. Bu değerleri girerek belirtiyoruz  */
    Key key,
    // @required
    this.icon,
    this.text,
    this.onTap,
    this.butonColor,
  })  : assert(text != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () => {},
    //   child: Row(
    //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: <Widget>[
    //       SizedBox(width: 50, height: 60),
    //       Icon(Icons.person),
    //       SizedBox(width: 20),
    //       Text(
    //         "Bildirimler",
    //         style: TextStyle(
    //           fontFamily: 'ProximaNova',
    //           color: Color(0xff000000),
    //           fontSize: 17,
    //           fontWeight: FontWeight.w400,
    //           fontStyle: FontStyle.normal,
    //           letterSpacing: 0,
    //         ),
    //       ),
    //       SizedBox(width: 20),
    //     ],
    //   ),
    // );

/* Burada ister Inkwell ister Gesture Detector kullan farkı yok  */
    /* ******************************  */
    return GestureDetector(
      onTap: onTap,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 50, height: 50),
          Icon(icon),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'ProximaNova',
              color: butonColor,
              fontSize: 17,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
