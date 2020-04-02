import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:buddy_up/home.dart';

//Controllers
final titleController = TextEditingController();
final descriptionController = TextEditingController();

class HelpRequestPage extends StatefulWidget {
  @override
  _HelpRequestPageState createState() => _HelpRequestPageState();
}

class _HelpRequestPageState extends State<HelpRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Help Request'),
      ), 
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title'
              ), 
            ), 
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description'
              ),
            ),
            RaisedButton(
              onPressed: () {
                submitHelpRequest(titleController.text, descriptionController.text);
              },
              child: Text('Submit'),
            ),
          ]
        ),
      ),
    );
  }
  // Help Request Submit 
  void submitHelpRequest(title, description)  async {
    ParseObject helpRequest = new ParseObject("Request");
    helpRequest.set("title", title);
    helpRequest.set("description", description);
    var result =  await helpRequest.create();
    if (result.success)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    else 
    {
       print(result.error.message);
    }
  }
 }