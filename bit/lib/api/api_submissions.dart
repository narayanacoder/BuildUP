import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UploadItem {
  String type;
  String imageUrl;

  UploadItem({this.type,this.imageUrl});

  factory UploadItem.fromJson(Map<String, dynamic> json) {
    return UploadItem(
      type: json['type'],
      imageUrl: json['imageUrl'],
    );
  }
}

class SubmissionItem {
  final int id;
  String name;
  String description;
  int numLikes;
  String country;
  String author;
  List<String> keywords;
  List<UploadItem> uploads;
  int problemId;

  SubmissionItem({this.id,this.name, this.description, this.numLikes, this.country, this.author, this.keywords, this.uploads, this.problemId});

  factory SubmissionItem.fromJson(Map<String, dynamic> json) {
    List<String> keywords = List<String>.from(json['keywords'].map((i) => i.toString().toLowerCase()));
    List<UploadItem> uploads = List<UploadItem>.from(json['uploads'].map((i) => UploadItem.fromJson(i)));
    return SubmissionItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      numLikes: json['numLikes'],
      country: json['country'],
      author: json['author'],
      keywords: keywords,
      uploads: uploads,
      problemId: json['problemId'],
    );
  }
}

class SubmissionsList {
  List<dynamic> submissions = []; //contains full json object.
  List<SubmissionItem> submissionItems = [];
  int submissionCount = 0;

  SubmissionsList({this.submissions, this.submissionItems, this.submissionCount});

  factory SubmissionsList.fromJson(List<dynamic> json) { //Map<String, dynamic>  if its an object.
  List<SubmissionItem> submissionsList = List<SubmissionItem>.from(json.map((i) => SubmissionItem.fromJson(i)));

    return SubmissionsList(
      submissions: json,
      submissionItems: submissionsList,
      submissionCount: submissionsList.length
    );
  }
}

Future<SubmissionsList> fetchSubmissionsPost() async {
  final response =  await http.get('http://10.0.2.2:3000/submissions');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return SubmissionsList.fromJson((json.decode(response.body)));  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post submissions');
  }
}

Future<SubmissionsList> fetchTopSubmissionsPost(int count) async {
  final response =  await http.get('http://10.0.2.2:3000/submissions/highest/numlikes/' + count.toString());
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return SubmissionsList.fromJson((json.decode(response.body)));  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post submissions');
  }
}