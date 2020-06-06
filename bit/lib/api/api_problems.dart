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

class CommentItem {
  String author;
  String comment;

  CommentItem({this.author,this.comment});

  factory CommentItem.fromJson(Map<String, dynamic> json) {
    return CommentItem(
      author: json['author'],
      comment: json['comment'],
    );
  }
}

class ProblemItem {
  final int id;
  String name;
  String description;
  int numLikes;
  String country;
  String author;
  List<String> keywords;
  List<UploadItem> uploads;
  int problemId;
  List<CommentItem> comments;
  //TODO: add deadline field.

  ProblemItem({this.id,this.name, this.description, this.numLikes, this.country, this.author, this.keywords, this.uploads, this.problemId, this.comments});

  factory ProblemItem.fromJson(Map<String, dynamic> json) {
    List<String> keywords = List<String>.from(json['keywords'].map((i) => i.toString().toLowerCase()));
    List<UploadItem> uploads = List<UploadItem>.from(json['uploads'].map((i) => UploadItem.fromJson(i)));
    List<CommentItem> comments = json['comments'] != null ? List<CommentItem>.from(json['comments'].map((i) => CommentItem.fromJson(i))) : null;
    return ProblemItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      numLikes: json['numLikes'],
      country: json['country'],
      author: json['author'],
      keywords: keywords,
      uploads: uploads,
      problemId: json['problemId'],
      comments: comments,
    );
  }
}

class ProblemsList {
  List<dynamic> problems = []; //contains full json object.
  List<ProblemItem> problemItems = [];
  int problemCount = 0;

  ProblemsList({this.problems, this.problemItems, this.problemCount});

  factory ProblemsList.fromJson(List<dynamic> json) { //Map<String, dynamic>  if its an object.
  List<ProblemItem> problemsList = List<ProblemItem>.from(json.map((i) => ProblemItem.fromJson(i)));

    return ProblemsList(
      problems: json,
      problemItems: problemsList,
      problemCount: problemsList.length
    );
  }
}

Future<ProblemsList> fetchProblemsPost() async {
  final response =  await http.get('http://10.0.2.2:3000/problems');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return ProblemsList.fromJson((json.decode(response.body)));  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post submissions');
  }
}

Future<ProblemsList> fetchTopProblemsPost(int count) async {
  final response =  await http.get('http://10.0.2.2:3000/problems/highest/numlikes/' + count.toString());
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return ProblemsList.fromJson((json.decode(response.body)));  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post submissions');
  }
}