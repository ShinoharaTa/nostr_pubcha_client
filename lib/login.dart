import 'package:flutter/material.dart';
import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('ログイン'),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ChatScreen()),
            // );
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
                (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
