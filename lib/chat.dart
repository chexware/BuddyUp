import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/data/request.dart';
import 'package:buddy_up/data/message.dart';
import 'package:buddy_up/home.dart';

class ChatPage extends StatelessWidget {
  
  final Request request;
  ChatPage({Key key, @required this.request}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(request.title),
        actions: <Widget>[
          RaisedButton(
              onPressed: (){
                completeRequest(context);
              },
              child: Text('Complete')
          )
        ],
      ), 
      body: Column(
        children: <Widget>[

        ]
      )
    );
  }

  // Complete Request
  void completeRequest(BuildContext context) async {
    // TO DO Updated the logic
    var currentRequest = ParseObject('Request')
      ..objectId =this.request.requestId
      ..set("isCompleted", true);

    var response = await currentRequest.save();
    if (response.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print(response.error.message);
    }
  }
  // Send Message
}
