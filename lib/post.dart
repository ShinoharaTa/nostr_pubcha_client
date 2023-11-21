import 'package:flutter/material.dart';
import 'package:nostr_core_dart/nostr.dart';
import 'package:nostr_pubcha_client/const/const.dart';
import 'package:nostr_pubcha_client/nostr/connect.dart';
import 'package:nostr_pubcha_client/nostr/store.dart';
import 'chat.dart';

class PostScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              maxLines: null, // 改行可能にする
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'What\'s up ?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 120),
            ElevatedButton(
              child: Text('投稿'),
              onPressed: () {
                // 共通関数にテキストエリアの内容を渡す
                post(_controller.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void post(String text) {
    // Event.from(kind: 1, content: text, tags: [], privkey: PublicCore.privateKey??"");
    Event channelMessage = Nip28.sendChannelMessage(
        AppConfig.channelId, text, null, null, PublicCore.privateKey ?? "");
    Connect.sharedInstance.sendEvent(channelMessage);
  }
}
