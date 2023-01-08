// ignore_for_file: unnecessary_new
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/welcome.dart';
import 'package:frontend/signin.dart';
import 'package:frontend/welcome.dart';
//import 'package:frontend/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  Future addUser() async {
    var res = await http.post(Uri.parse("http://localhost:3000/adduser"),
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
                  "Signup",
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
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return null;
                      } else {
                        return 'Enter valid email';
                      }
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.near_me,
                          color: Color(0xFF087F87),
                        ),
                        hintText: 'Enter email',
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
                            addUser();
                          } else {
                            print("not ok");
                          }
                        },
                        child: Text(
                          "Signup",
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
