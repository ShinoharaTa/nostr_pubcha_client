import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nostr_pubcha_client/nostr/connect.dart';
import 'package:nostr_pubcha_client/nostr/profile.dart';
import 'package:nostr_pubcha_client/nostr/store.dart';
import 'chat.dart';
import "const/const.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
  // step 2 タイムラインを取得する
  //   次のリレーを、リストに登録してタイムラインを購読してみましょう
  //   wss://relay-jp.nostr.wirednet.jp/
  //   wss://yabu.me/
  //   wss://r.kojira.io/
  //   wss://relay-jp.shino3.net/

  // final List<String> relays = []
  //   '',
  //   ''
  // ];

  int connectedRelays = 0;

  @override
  void initState() {
    super.initState();
    // step 3 ログイン後のナビゲーションを考える
    // Connect.sharedInstance.addConnectStatusListener((relay, status) {
    //   if (status != 0) {
    //     // リレーステータスが未接続から変更されたら更新
    //     connectedRelays++;
    //     if (connectedRelays == relays.length) {
    //       checkLoginAndNavigate();
    //     }
    //   }
    // });

    // step 2 タイムラインを取得する
    // Connect.sharedInstance.connectRelays(relays);
  }

  // step 3 ログイン後のナビゲーションを考える
  void checkLoginAndNavigate() async {
    // アプリケーションに保存されたログイン情報を取得する
    // await loadingProfile();
    if (PublicCore.privateKey != null) {
      // もし、秘密鍵をもっていたらチャット画面を表示したい
      // チャット画面に飛ばす処理をここに書こう
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
                  // await generateProfile();
                  // step 1, 画面遷移を作る
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChatScreen() ));
                  // step 1.2, 「戻る」ナビゲーションが発生しない画面遷移
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChatScreen()),
                  //   (Route<dynamic> route) => false,
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
