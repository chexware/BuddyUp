import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/data/request.dart';
import 'package:buddy_up/data/message.dart';
import 'package:buddy_up/home.dart';

class ChatPage extends StatelessWidget {
  final messageController = TextEditingController();
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
      body: Stack(
        children: <Widget>[
              ParseLiveListWidget<ParseObject>(
                query:   QueryBuilder<ParseObject>(ParseObject('Message')) 
                          ..whereEqualTo('requestId',  this.request.requestId)
                          ..orderByDescending('createdAt')
                          ..setLimit(15),
                reverse: false,
                childBuilder: 
                  (BuildContext context, ParseLiveListElementSnapshot<ParseObject> snapshot) {
                    if (snapshot.failed) {
                      return Text('something went wrong!');
                    }
                    else if (snapshot.hasData){
                        return Text( snapshot.loadedData.get("senderId")+ " : " +snapshot.loadedData.get("text"));
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              
                Column(
                  children: <Widget>[
                    TextFormField(
                      controller: messageController,
                        decoration: InputDecoration(
                          labelText: 'New Message'
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          sendMessage(context, messageController.text);
                        },
                        child: Text('Send'),
                      ),
                  ]
                )
             ]
          )
      );
  }

  // Complete Request
  void completeRequest(BuildContext context) async {
    // TO DO Updated the logic
    var currentRequest = ParseObject('Request')
      ..objectId = this.request.requestId
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
  void sendMessage(BuildContext context, String text) async{
    // TO DO messages should have sender name
     var message = ParseObject('Message')
      ..set("requestId", this.request.requestId)
      ..set("senderId", "TO D")
      ..set("text", text);

    var response = await message.save();
    if (response.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatPage(request: this.request)),
      );
    } else {
      print(response.error.message);
    }

  }
  
}
