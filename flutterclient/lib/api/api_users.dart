import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterclient/utilities/common_objects.dart';

class User {
  final int id;
  String firstName;
  String lastName;
  String description;
  String country;
  String email;
  int phoneNumber;
  List<String> saved;
  List<String> submitted;
  List<String> favorites;
  String profilePic;
  //TODO: add deadline field.

  User({this.id, this.firstName, this.lastName, this.description, this.country, this.email, this.phoneNumber, this.saved, this.submitted, this.favorites, this.profilePic});

  factory User.fromJson(Map<String, dynamic> json) {
    List<String> saved = json['saved'] != null ? List<String>.from(json['saved'].map((i) => i.toString())) : [];
    List<String> submitted = json['submitted'] != null ? List<String>.from(json['submitted'].map((i) => i.toString())) : [];
    List<String> favorites = json['favorites'] != null ? List<String>.from(json['favorites'].map((i) => i.toString())) : [];
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      description: json['description'],
      country: json['country'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      saved: saved,
      submitted: submitted,
      favorites: favorites,
      profilePic: json['profilePic'],
    );
  }
}

class UsersList {
  List<dynamic> users = []; //contains full json object.
  List<User> userItems = [];
  int userCount = 0;

  UsersList({this.users, this.userItems, this.userCount});

  factory UsersList.fromJson(List<dynamic> json) { //Map<String, dynamic>  if its an object.
    List<User> usersList = List<User>.from(json.map((i) => User.fromJson(i)));

    return UsersList(
        users: json,
        userItems: usersList,
        userCount: usersList.length
    );
  }
}

Future<User> fetchUser() async {
  final response =  await http.get('http://10.0.2.2:3000/users/name/Charlie/Gray');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return (UsersList.fromJson(json.decode(response.body))).userItems[0];  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to fetch user data');
  }
}