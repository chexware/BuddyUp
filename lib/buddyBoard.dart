import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class BuddyBoardPage extends StatefulWidget {
  @override
  _BuddyBoardPageState createState() => _BuddyBoardPageState();
}

class _BuddyBoardPageState extends State<BuddyBoardPage> {
  List<String> _helpRequests = new List<String>();
  @override
  void initState() {
    _getHelpRequestsLive();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: _helpRequests.length,
          itemBuilder: (BuildContext context, int index) {
             return Center(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                       onPressed: (){},
                        child: Text(
                          _helpRequests[index],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ],
                ),
              )
             );
          },
        ),
      ],
    );
  }
  void _getHelpRequestsLive() async
  {
    var apiResponse = await ParseObject('Request').getAll();
    if (apiResponse.success){
      for (var testObject in apiResponse.result) {
          _helpRequests.add(testObject.get('title').toString());
          print(testObject.get('title').toString());

        }
    }
    else 
    {
      print(apiResponse.error.message);
    }
  }
 }