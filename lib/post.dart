import 'package:flutter/material.dart';
import 'chat.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('投稿'),
          onPressed: () {
            // 投稿処理をここに書きます
            // ...
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
