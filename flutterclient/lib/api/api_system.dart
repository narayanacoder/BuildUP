import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterclient/utilities/common_objects.dart';
import 'package:flutterclient/api/api_users.dart';
import 'package:flutterclient/api/api_submissions.dart';

class System {
  final int id;
  String currentLocale;
  User currentUser;
  List<String> supportedLocales;
  //TODO: add deadline field.

  System({this.id, this.currentLocale, this.currentUser, this.supportedLocales});

  factory System.fromJson(Map<String, dynamic> json) {
    List<String> supportedLocales = json['saved'] != null ? List<String>.from(json['saved'].map((i) => i.toString())) : [];
    User currentUser = json['currentUser'] != null ? User.fromJson(json['currentUser']) : {};
    return System(
      id: json['id'],
      currentLocale: json['currentLocale'],
      currentUser: currentUser,
      supportedLocales: supportedLocales,
    );
  }
}

Future<User> fetchCurrentUser() async {
  final response =  await http.get('http://10.0.2.2:3000/system/currentUser');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return (User.fromJson(json.decode(response.body)));  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to fetch current user from system data');
  }
}

Future<CommonContainerList> fetchCurrentUserSaved() async {
  final response =  await http.get('http://10.0.2.2:3000/system/currentUser/saved');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return submissionToContainerList(SubmissionsList.fromJson((json.decode(response.body))));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to fetch current user from system data');
  }
}

Future<CommonContainerList> fetchCurrentUserSubmitted() async {
  final response =  await http.get('http://10.0.2.2:3000/system/currentUser/submitted');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return submissionToContainerList(SubmissionsList.fromJson((json.decode(response.body))));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to fetch current user from system data');
  }
}