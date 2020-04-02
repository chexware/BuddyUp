import 'package:buddy_up/authentication/logIn.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:flutter/material.dart';


//Keys from back4app
const String PARSE_APP_ID = 'AuQmcaFKUtIUi0vtqH2nyqz6wirUPCty12dyTZm0';
const String PARSE_APP_URL = 'https://parseapi.back4app.com';
const String MASTER_KEY = '1skgLEVRdxobZ8gxtO8j50Ta4KpLmEYR2iBoP9Fj';

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
        home: LogInPage(),
      );
  }
}





