import 'package:flutter/material.dart';
import 'package:buddy_up/data/request.dart';
import 'package:buddy_up/chat.dart';

class ViewRequestPage extends StatelessWidget {
  
  final Request request;
  ViewRequestPage({Key key, @required this.request}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.request.title),
      ), 
      body: Column(
        children: <Widget>[
            Text(this.request.description),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ChatPage(request: this.request)),
                    );
              },
              child: Text('Help')
            )
        ]
      ),
    );
  }
}
