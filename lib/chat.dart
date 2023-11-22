import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nostr_core_dart/nostr.dart';
import 'const/const.dart';
import 'settings.dart';
import 'post.dart';
import "nostr/content.dart";
import "widgets/posts.dart";

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Step 2 タイムラインを表示してみよう
  final _streamController = StreamController<List<PostListItem>>();
  // void recentChannelMessagesCallback(
  //     List<ChannelMessageItem> channelMessageList) {
  //   var postListItems = channelMessageList.map((channelItem) {
  //     return PostListItem(
  //       id: channelItem.id,
  //       name: channelItem.author,
  //       text: channelItem.content,
  //       images: "",
  //       datetime: channelItem.datetime,
  //     );
  //   }).toList();
  //   _streamController.add( ??? );
  // }

  @override
  void initState() {
    super.initState();
    // fetchRecentChannelMessages(AppConfig.channelId, recentChannelMessagesCallback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャット'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // step 1
              // 押されたときに期待する画面遷移のナビゲーションを記載する
              // ???
            },
          ),
        ],
      ),
      body: StreamBuilder<List<PostListItem>>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          // step 2 タイムラインを表示してみよう
          // データがない場合
          // if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          // }

          // データがある場合
          // List<PostListItem> postItems = snapshot.data!;
          // return ListView.builder(
          //   itemCount: postItems.length,
          //   itemBuilder: (context, index) {
          //     PostListItem item = postItems[index];
          //     return ListTile(
          //       title: Text('Item ${item.name}'),
          //       subtitle: Text(item.text),
          //     );
          //   },
          // );
        },
      ),
      // ↓ 投稿ボタン
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // step 1
          // 押されたときに期待する画面遷移のナビゲーションを記載する
          // ???
        },
      ),
    );
  }
}
