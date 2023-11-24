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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'パブリックチャットに投稿してみよう',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
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

  // step 4 タイムラインに投稿してみよう
  void post(String text) {
    // Event channelMessage = Nip28.sendChannelMessage(
        // チャンネルID
        // 投稿内容
        // null,
        // null,
        // 作成された秘密鍵 ※ key ?? "" の形式で必ず文字列を渡す
    // );
    // Connect.sharedInstance.???( ??? );
    Event channelMessage = Nip28.sendChannelMessage(
        AppConfig.channelId,
        text,
        null,
        null,
        PublicCore.privateKey ?? ""
    );
    Connect.sharedInstance.sendEvent( channelMessage );
  }
}
