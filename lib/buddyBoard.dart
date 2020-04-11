import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/data/request.dart';
import 'package:buddy_up/viewRequest.dart';



class BuddyBoardPage extends StatefulWidget {
  @override
  _BuddyBoardPageState createState() => _BuddyBoardPageState();
}

class _BuddyBoardPageState extends State<BuddyBoardPage> {
  QueryBuilder<ParseObject> requestsQuery = 
    QueryBuilder<ParseObject>(ParseObject('Request')) 
    ..whereEqualTo('isCompleted', false);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ParseLiveListWidget<ParseObject>(
          query: requestsQuery,
          reverse: false,
          childBuilder: 
            (BuildContext context, ParseLiveListElementSnapshot<ParseObject> snapshot) {
              if (snapshot.failed) {
                return Text('something went wrong!');
              }
              else if (snapshot.hasData){
                return RaisedButton(
                       onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ViewRequestPage(request: Request(
                                snapshot.loadedData.get('title'),
                                snapshot.loadedData.get('description'),
                                snapshot.loadedData.get('isCompleted')
                            ))),
                          );
                       },
                        child: Text( snapshot.loadedData.get("title") ),
                  );
               
              } else {
                return CircularProgressIndicator();
              }
            },
        ),
        
      
      ],
    );
  }
}