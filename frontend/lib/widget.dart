import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/signin.dart';
import 'package:frontend/signup.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../pages/home.dart';

// Page Decoration
/*PageDecoration pageDecoration(Color? color) {
  return PageDecoration(
    pageColor: color,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 35,
      fontWeight: FontWeight.w500,
    ),
    bodyTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  );
}*/
PageDecoration buildDecoration() => PageDecoration(
      imagePadding: EdgeInsets.all(0),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto'),
      bodyTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w300,
        fontFamily: 'Roboto',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 251, 251, 251),
            Color(0xFF087F87),
          ],
        ),
      ),
    );

// Get Start Button
Padding getStartButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 0),
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      onPressed: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => HomePage()));
      },
      minWidth: 320,
      height: 50,
      color: Colors.white,
      child: Text(
        "Get Started",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

// Dots Decoration
DotsDecorator DotsDecoration() {
  return DotsDecorator(
      size: const Size.square(8.0),
      activeColor: Color(0xff0D4BA1),
      activeSize: const Size(30.0, 8.0),
      color: Colors.white,
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)));
}

// List of Pages
List<PageViewModel> getPages(context) {
  return [
    PageViewModel(
        decoration: buildDecoration(),
        body:
            "Absolutely love this depiction of therapy. Please remember how powerful talking is ...",
        title: "Talk Therapy",
        image: Image.asset(
          'images/1.png',
        )),
    PageViewModel(
        decoration: buildDecoration(),
        body:
            "Tips to improve your mental state whenever it's going down ",
        title: "Mental Improvement",
        image: Image.asset(
          'images/2.png',
        )),
    PageViewModel(
        decoration: buildDecoration(),
        body:
            "I am an AI friend, you can chat with me about your emotions and thoughts",
        title: "It's Me",
        image: Image.asset(
          'images/3.png',
        ),
        footer: getStartButton(context)),
  ];
}

// Global Footer
Container globalFooter(BuildContext context) {
  return Container(
    width: double.infinity,
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: 180,
          height: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => Signin()));
            },
            child: Text("Signin"),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
              backgroundColor: MaterialStateProperty.all(Color(0xff66CBFE)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: 180,
          height: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => Signup()));
            },
            child: Text("Sign Up"),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
                backgroundColor: MaterialStateProperty.all(Color(0xff0D4BA1))),
          ),
        )
      ],
    ),
  );
}

// Skip Button Text
Text skipText() {
  return Text(
    "Skip",
    style: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
  );
}

// Next Button Text
Row nextText() {
  return Row(
    children: [
      Text(
        "Next",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
        color: Colors.white,
      )
    ],
  );
}
