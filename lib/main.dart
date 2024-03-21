import 'package:ecare/view/bot.dart';
import 'package:ecare/view/homepage.dart';
import 'package:ecare/view/homescreen.dart';
import 'package:ecare/view/onboard.dart';
import 'package:ecare/view/signup.dart';
import 'package:ecare/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'view/signin.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      initialRoute: 'splash',
      routes: {
        'splash': (context)=> const SplashScreen(),
        'Intro': (context)=> IntroScreen(),
        'signin' : (context)=> SignIn(),
        'signup' : (context)=> SignUp(),
        'chatbot': (context)=> ChatBot(),
        'home': (context)=>HomeScreen(title: 'Ecare',)

      },
    );
  }
}


