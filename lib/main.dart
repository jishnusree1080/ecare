import 'package:ecare/view/bot.dart';
import 'package:ecare/view/onboard.dart';
import 'package:ecare/view/signup.dart';
import 'package:ecare/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/tabs/HomeTab.dart';
import 'model/tabs/ScheduleTab.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      initialRoute: 'splash',
      routes: {
        'splash': (context)=> const SplashScreen(),
        'Intro': (context)=> IntroScreen(),
        'signin' : (context)=> SignIn(),
        'signup' : (context)=> SignUp(),
        'chatbot': (context)=> ChatBot(),
        'home': (context)=>ScheduleTab()
      },
    );
  }
}


