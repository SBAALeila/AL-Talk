import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// ignore: unused_import
import 'package:frontend/signup.dart';
import '../widget.dart';

class MainScreen extends StatelessWidget {

  
/////////////////////////////////////
/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      isTopSafeArea: true,
      next: nextText(),
      done: SizedBox(),
      showSkipButton: true,
      skip: skipText(),
      dotsFlex: 2,
      onDone: () {},
      curve: Curves.fastLinearToSlowEaseIn,
      globalFooter: globalFooter(context),
      pages: getPages(context),
      dotsDecorator: DotsDecoration(),
    );
  }
}