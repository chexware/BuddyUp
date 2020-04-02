import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:buddy_up/authentication/logIn.dart';
import 'package:buddy_up/buddyBoard.dart';
import 'package:buddy_up/helpRequest.dart';


ParseUser _loggedUser;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  
  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    if (_loggedUser == null ){
      return new LogInPage();
    } 
    else 
    {
      return Scaffold(
        body: Column(
          children: [
          RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpRequestPage()),
                  );
                },
                child: Text('Find Buddy'),
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuddyBoardPage()),
                  );
                },
                child: Text('Offer Help'),
            ),
          ],
        )
      );
    }
  }
}

void _loadUser () async {
  //The current user was save in the phone with SharedPrefferences
   ParseUser currentUser = await ParseUser.currentUser(); 
    if (currentUser == null) {
      _loggedUser = null;
    } 
    else {
      _loggedUser = currentUser;
    }
}