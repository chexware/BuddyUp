import 'package:flutter/material.dart';
import 'package:buddy_up/data/request.dart';
import 'package:buddy_up/data/message.dart';

class ChatPage extends StatelessWidget {
  
  final Request request;
  ChatPage({Key key, @required this.request}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ), 
    );
  }
}
