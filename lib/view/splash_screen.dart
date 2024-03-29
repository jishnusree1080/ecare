import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecare/view/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homepage.dart';
import 'onboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Center(
      child: LottieBuilder.asset("assets/images/lottie/Animation .json"),
    ), nextScreen: SignIn(),
      splashIconSize: 400,

   );
  }
}
