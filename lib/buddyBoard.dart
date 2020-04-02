import 'package:flutter/material.dart';

class BuddyBoardPage extends StatefulWidget {
  @override
  _BuddyBoardPageState createState() => _BuddyBoardPageState();
}

class _BuddyBoardPageState extends State<BuddyBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         RaisedButton(
              onPressed: () {
              },
              child: Text('Find Buddy'),
          ),
          RaisedButton(
              onPressed: () {
              },
              child: Text('Offer Help'),
          ),
        ],
      )
    );
  }
 }