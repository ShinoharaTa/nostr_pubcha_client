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
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'ユーザーID',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: Text('ログイン'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                      (Route<dynamic> route) => false,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
