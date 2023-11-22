import 'package:flutter/material.dart';
import 'package:nostr_pubcha_client/nostr/profile.dart';
import 'package:nostr_pubcha_client/nostr/store.dart';
import 'login.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State {
  bool _showPrivateKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('公開鍵'),
            SelectableText(
              PublicCore.publicKey != null ? getEncodedPubkey(PublicCore.publicKey) : '公開鍵がありません',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text('秘密鍵'),
            Row(
              children: <Widget>[
                Expanded(
                  child: SelectableText(
                    _showPrivateKey
                        ? (PublicCore.privateKey != null ? getEncodedPrivkey(PublicCore.privateKey) : '公開鍵がありません')
                        : '●●●●●●',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _showPrivateKey ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPrivateKey = !_showPrivateKey;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('ログアウト'),
              onPressed: () {
                // clearProfile();
                // step 1 押されたときの画面遷移を記載する
                // ???
                // step 1.2, 「戻る」ナビゲーションが発生しない画面遷移
              },
            ),
          ],
        ),
      ),
    );
  }
}
