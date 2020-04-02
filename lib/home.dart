import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:buddy_up/authentication/logIn.dart';
import 'package:buddy_up/buddyBoard.dart';

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
        return LogInPage();
    } 
    else 
    {
        return  BuddyBoardPage();
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