import 'package:flutter/material.dart';
import 'package:nostr_pubcha_client/nostr/profile.dart';
import 'login.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('ログアウト'),
          onPressed: () {
            clearProfile();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}
