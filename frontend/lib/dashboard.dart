import 'package:flutter/material.dart';
import 'package:frontend/Messages.dart';
import 'package:frontend/exit.dart';
import 'package:frontend/pages/main_page.dart';
import 'package:frontend/signin.dart';
import 'package:frontend/welcome.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new exit(),
                  )),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFD4DEE3),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Welcome(),
            ));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: Text('CHAT ME'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showExitPopup();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Today, ${DateFormat("Hm").format(DateTime.now())}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFF6EB4C3),
                ),
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.indigo),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Type your message here',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    )),
                    IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);

                          _controller.clear();
                        },
                        // ignore: prefer_const_constructors
                        icon: Icon(
                          Icons.send,
                          size: 23.0,
                          color: Colors.indigo,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
      ScaffoldMessenger.of(context)
          // ignore: prefer_const_constructors
          .showSnackBar(SnackBar(
        content: Stack(
          children: [
            Container(
                padding: EdgeInsets.all(16),
                height: 80,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 28, 28),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "oh!",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            "Message is empty ",
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
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
