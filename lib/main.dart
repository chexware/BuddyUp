import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'package:buddy_up/home.dart';
import 'package:buddy_up/parseServerInfo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Parse().initialize(
    PARSE_APP_ID,
    PARSE_APP_URL,
    masterKey: MASTER_KEY,
    autoSendSessionId: true,
    debug: true,
    coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  );
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BuddyUp',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: HomePage(),
      );
  }
}





