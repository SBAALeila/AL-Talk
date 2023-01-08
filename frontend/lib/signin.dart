import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import'package:frontend/welcome.dart';
import 'package:frontend/signup.dart';
//import 'package:frontend/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://localhost:3000/authenticate"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': email,
          'password': password
        });
    if (jsonDecode(res.body)['success'] == true) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Welcome()));
    } else {
      print(jsonDecode(res.body));
      ScaffoldMessenger.of(context)
          // ignore: prefer_const_constructors
          .showSnackBar(SnackBar(
        content: Stack(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                height: 90,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 28, 28),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    const SizedBox(width: 48),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "oh!",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "USER NOT FOUND ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(4, 237, 237, 241),
        elevation: 0,
      ));
    }
  }

  var email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
          Container(
                    padding: EdgeInsets.only(top: 0, left: 250),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/logo.png'),
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                    // ignore: prefer_const_constructors
                  ),
        Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Signin",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 90,
                      color: Color(0xFF032D68)),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: email),
                    //controller: _email,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Enter something';
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return null;
                      } else {
                        return 'Enter valid email';
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color(0xFF087F87),
                        ),
                        hintText: 'Enter Email',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF087F87))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF087F87))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: TextEditingController(text: password),
                    //controller: _password,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color(0xFF087F87),
                        ),
                        hintText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF087F87))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xFF087F87))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                  child: Container(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF087F87),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Dashboard();
                            save();
                          } else {
                            print("not ok");
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 18,
                              color: Color(0xFF032D68),
                              fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
