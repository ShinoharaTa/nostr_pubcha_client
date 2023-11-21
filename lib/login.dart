import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nostr_pubcha_client/nostr/connect.dart';
import 'package:nostr_pubcha_client/nostr/profile.dart';
import 'package:nostr_pubcha_client/nostr/store.dart';
import 'chat.dart';
import "const/const.dart";

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
 final List<String> relays = [
    'wss://relay-jp.nostr.wirednet.jp/',
    'wss://yabu.me/',
    'wss://r.kojira.io/',
    'wss://relay-jp.shino3.net/'
  ];
  int connectedRelays = 0;

  @override
  void initState() {
    super.initState();
    Connect.sharedInstance.addConnectStatusListener((relay, status) {
      if (status == 1) {
        connectedRelays++;
        if (connectedRelays == relays.length) {
          // 全てのリレーが接続されたら
          checkLoginAndNavigate();
        }
      }
    });
    Connect.sharedInstance.connectRelays(relays);
  }

  void checkLoginAndNavigate() async {
    await loadingProfile();
    if (PublicCore.privateKey != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                  child: Text(
                termsText,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('アカウント新規作成'),
                onPressed: () async {
                  await generateProfile();
                  // print(generatePrivateKey());
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            // SizedBox(height: 16),
            // SizedBox(
            //   width: double.infinity,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       labelText: 'ユーザーID',
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 4),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       child: Text('ログイン'),
            //       onPressed: () {
            //         Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(builder: (context) => ChatScreen()),
            //           (Route<dynamic> route) => false,
            //         );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
