import 'dart:convert';
import 'package:nostr_core_dart/nostr.dart';

class UserProfile {
  final String password;
  final String enPrivkey;
  final Keychain user;

  UserProfile({
    required this.enPrivkey,
    required this.password,
    required this.user,
  });
}

class User {
  String? name;
  String? displayName;
  String? about;
  String? picture;

  User({
    this.name,
    this.displayName,
    this.about,
    this.picture,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      displayName: map['display_name'] as String,
      about: map['about'] as String,
      picture: map['picture'] as String,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    displayName: json['displayName'],
    about: json['about'],
    picture: json['picture'],
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'display_name': displayName,
      'about': about,
      'picture': picture,
    };
  }

  String toJson() => json.encode(toMap());
}

