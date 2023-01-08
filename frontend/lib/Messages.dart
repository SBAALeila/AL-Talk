import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                widget.messages[index]['isUserMessage']
                    ? Container()
                    : Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/robot.jpg"),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Bubble(
                      radius: Radius.circular(15.0),
                      color: widget.messages[index]['isUserMessage']
                          ? Color(0xFF179D8B)
                          : Color(0xFF456370),
                      elevation: 0.0,
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                                child: Container(
                              constraints: BoxConstraints(maxWidth: 150),
                              child: Text(
                                widget.messages[index]['message'].text.text[0],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                          ],
                        ),
                      )),
                ),
                widget.messages[index]['isUserMessage']
                    ? Container(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/default.jpg"),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
