import 'package:flutter/material.dart';
import 'chat.dart';
import "const/text.dart";

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

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('ログイン'),
          ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SelectableText(
                termsText,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  child: Text('アカウント新規作成'),
                  onPressed: () {
                    // 新規作成画面に遷移するロジック
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ユーザーID',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(width: 8), // テキストフィールドとボタンの間にスペースを追加
                ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () {
                    // ログイン画面に遷移するロジック
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
