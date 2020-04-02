import 'package:buddy_up/authentication/signUp.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/home.dart';

//Controllers
final usernameController = TextEditingController();
final passController = TextEditingController();

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ), 
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username'
              ), 
            ), 
            TextFormField(
              controller: passController,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true, 
            ),
            RaisedButton(
              onPressed: (){
                logIn(usernameController.text, passController.text);
              },
              child: Text('Log In'),
            ),
            Container(
                child: Text( '_____Or_____'),
            ),  
            RaisedButton(
              onPressed: () {
                Navigator.of(context)
                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                     return SignUpPage();
                  }),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ), 
      ),
    ); 
  }
  //Login
  Future<ParseUser> logIn(username, pass) async {
    var user = ParseUser(username, pass,'');
    var response = await user.login();
    if (response.success) {
      setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
      });
    } else {
      print(response.error.message);
    }
  }
}
