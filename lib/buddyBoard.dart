import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/data/request.dart';
import 'package:buddy_up/viewRequest.dart';

List<Request> helpRequests;
class BuddyBoardPage extends StatefulWidget {
  @override
  _BuddyBoardPageState createState() => _BuddyBoardPageState();
}
  Future<void> getHelpRequestsLive() async
  {
   // final LiveQuery liveQuery = LiveQuery(debug: true);
    //QueryBuilder<ParseObject> requestsQuery = 
      //QueryBuilder<ParseObject>(ParseObject('Request'))
      //..whereEqualTo('isCompleted', false);
      helpRequests = new List<Request>();
    //TO DO update  Help Request handling to  use Live Queries
    var apiResponse = await ParseObject("Request").getAll().;
    if (apiResponse.success){
      for (var testObject in apiResponse.result) {

          helpRequests.add(new Request(testObject.get('title').toString()
                                      , testObject.get('description').toString()
                                      , testObject.get('isCompleted')));
          print(helpRequests[helpRequests.length-1].title);
      }
      if (helpRequests.length == 0 ) {
         print("No Need For Help");
      }
    }
    else 
    {
      print(apiResponse.error.message);
    }
  }
 

class _BuddyBoardPageState extends State<BuddyBoardPage> {
  @override
  void initState() {
    getHelpRequestsLive();
    super.initState();
  }
  Widget build(BuildContext context) {
    getHelpRequestsLive();
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: helpRequests.length,
          itemBuilder: (BuildContext context, int index) {
            if (helpRequests.length == 0) {
              return Text("NO NEED FOR HELP",
                          style: TextStyle(
                            color: Colors.white,
                          ),);
            }
            return Center(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                       onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewRequestPage(request: helpRequests[index])),
                          );
                       },
                        child: Text(
                          helpRequests[index].title,
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
}