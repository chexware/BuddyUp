import 'package:flutter/material.dart';

class BuddyBoardPage extends StatefulWidget {
  @override
  _BuddyBoardPageState createState() => _BuddyBoardPageState();
}

class _BuddyBoardPageState extends State<BuddyBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ), 
      body: Text('Welcome to BuddyUp'),
    );
  }
 }