import 'package:e_oturum_30_ocak/AllScreens/loginscreen.dart';
import 'package:e_oturum_30_ocak/AllScreens/mainscreen.dart';
import 'package:e_oturum_30_ocak/AllScreens/registerationScreen.dart';
import 'package:e_oturum_30_ocak/AllScreens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  RegisterationScreen.idScreen: (context) => RegisterationScreen(),
  LoginScreen.idScreen: (context) => LoginScreen(),
  MainScreen.idScreen: (context) => MainScreen(),
  SplashScreeen.routeName: (context) => SplashScreeen(),
};
