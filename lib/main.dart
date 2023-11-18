import 'package:flutter/material.dart';
import 'nostr/connect.dart';
import 'login.dart';

void main() {
  // LocaleSettings.useDeviceLocale();
  final List<String> relays = ['wss://r.kojira.io/'];
  Connect.sharedInstance.connectRelays(relays);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
