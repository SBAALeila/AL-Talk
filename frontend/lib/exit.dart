import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/pages/main_page.dart';

class exit extends StatelessWidget {
  const exit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: 
      const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 251, 251, 251),
                Color(0xFF087F87),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Container(
        child: Center(
          child: SizedBox(
            height: 400,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 12, sigmaX: 12),
                      child: Container(
                        alignment: Alignment.topLeft,
                        color: Colors.white.withOpacity(.3),
                        padding: const EdgeInsets.all(42),
                        child: const Text(
                          "Even if happiness forgets you a little bit never completely forget about it 🤝 \nI'am waiting for you ",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 28.00,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 30, top: 100),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Text(
                      "🤞",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 30, top: 300),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Text(
                    "🖐",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 24),
                  ),
                ),
                Positioned(
                    bottom: 30,
                    left: 300,
                    right: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => MainScreen()));
                        },
                        child: Container(
                          width: 5,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFF032D68),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Center(
                            child: Text(
                              "Exit",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}