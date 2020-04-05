import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/authentication/logIn.dart';


// Controllers
final usernameController = TextEditingController();
final emailController = TextEditingController();
final passController = TextEditingController();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> { 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email'
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
                 signUp(usernameController.text, passController.text,
                  emailController.text);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
  //Sign UP
  Future<ParseUser> signUp(username, pass, email) async {
    //You can add Collumns to user object adding "..set(key,value)"
    var user = ParseUser(username, pass, email); 
    var result = await user.create();
    if (result.success) {
      setState(() {
        usernameController.clear();
        emailController.clear();
        passController.clear();
        Navigator.pop(context);
      });
    } else {
      print(result.error.message);
    }
  }
}
 