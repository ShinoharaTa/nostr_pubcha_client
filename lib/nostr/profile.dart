import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:nostr_core_dart/nostr.dart';
import 'package:nostr_pubcha_client/nostr/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../const/const.dart';
import "types.dart";
import 'connect.dart';

Uint8List _decryptPrivateKeyWithMap(Map map) {
  return decryptPrivateKey(hexToBytes(map['privkey']), map['password']);
}

Future<Uint8List> _encryptPrivateKeyWithMap(Map map) async {
  return encryptPrivateKey(hexToBytes(map['privkey']), map['password']);
}

Future<UserProfile> generatePrivateKey() async {
  Keychain user = Keychain.generate();
  String defaultPassword = generateStrongPassword(16);
  String enPrivkey = bytesToHex(await _encryptPrivateKeyWithMap(
      {'privkey': user.private, 'password': defaultPassword}));
  return UserProfile(
      user: user, enPrivkey: enPrivkey, password: defaultPassword);
}

String getEncodedPrivkey(privKey) {
  return Nip19.encodePrivkey(privKey);
}

String getEncodedPubkey(pubKey) {
  return Nip19.encodePubkey(pubKey);
}

nsecLogin(String nsec) async {
  return Event.from(kind: 2, tags: [], content: "", privkey: Nip19.decodePrivkey(nsec));
  // nsec1hxwcg2lypc8ma5pan00lvfc50juz6rfecj3hgx3pnkzfkq7md9qqg4f49v
}

generateProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final result = await generatePrivateKey();
  // print(result.enPrivkey);
  // print(getEncodedPubkey(result.user.public));
  // print(getEncodedPrivkey(result.user.private));
  PublicCore.privateKey = result.user.private;
  PublicCore.publicKey = result.user.public;
  final String avatar_url =
      'https://api.dicebear.com/7.x/thumbs/svg?seed=${result.user.public}';
  User user = User(
    about: AppConfig.me.about,
    picture: avatar_url,
    name: AppConfig.me.name,
    displayName: AppConfig.me.displayName,
  );
  PublicCore.user = user;
  Event event = Nip1.setMetadata(user.toJson(), result.user.private);
  Connect.sharedInstance.sendEvent(event);
  await prefs.setString("me_sec", result.user.private);
  await prefs.setString("me_pub", result.user.public);
  await prefs.setString("me_user", user.toJson());
  // Event channelMessage = Nip28.sendChannelMessage(
  //     AppConfig.channelId, "hello!", null, null, result.user.private);
  // Connect.sharedInstance.sendEvent(channelMessage);
  // final newUser = UsersCompanion(
  //   pubkeyHex: result.user.public,
  //   privkeyHex: result.enPrivkey,
  //   password: result.password,
  //   name: "shino3_test_name",
  //   displayName: d.Value(t.AnonymousDisplayNamePrefix),
  //   bio: const d.Value(''),
  //   avatar: d.Value(avatar_url),
  //   kind0: d.Value(event.content),
  //   updateAt: DateTime.now()),
  // );
  // await database.userDao.insertUser(newUser);
}

loadingProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? sec = prefs.getString("me_sec");
  String? pub = prefs.getString("me_pub");
  String? userJson = prefs.getString("me_user");

  if (sec != null && pub != null && userJson != null) {
    // ここで読み込んだ情報をローカル変数にセット
    // 例: User user = User.fromJson(json.decode(userJson));
    PublicCore.privateKey = sec;
    PublicCore.publicKey = pub;
    PublicCore.user = User.fromJson(json.decode(userJson));
    print(PublicCore.privateKey);
    print(PublicCore.publicKey);
    print(PublicCore.user);
    AppConfig.me = User.fromJson(json.decode(userJson));
  }
}

clearProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("me_sec");
  prefs.remove("me_pub");
  prefs.remove("me_user");
  PublicCore.privateKey = null;
  PublicCore.publicKey = null;
  PublicCore.user = null;
}
