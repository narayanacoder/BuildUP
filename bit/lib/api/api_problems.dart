import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bit/utilities/common_objects.dart';

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
  List<UploadItem> impact;
  //TODO: add deadline field.

  ProblemItem({this.id,this.name, this.description, this.numLikes, this.country, this.author, this.keywords, this.uploads, this.problemId, this.comments, this.impact});

  factory ProblemItem.fromJson(Map<String, dynamic> json) {
    List<String> keywords = List<String>.from(json['keywords'].map((i) => i.toString().toLowerCase()));
    List<UploadItem> uploads = List<UploadItem>.from(json['uploads'].map((i) => UploadItem.fromJson(i)));
    List<CommentItem> comments = json['comments'] != null ? List<CommentItem>.from(json['comments'].map((i) => CommentItem.fromJson(i))) : null;
    List<UploadItem> impact = json['impact'] != null ? List<UploadItem>.from(json['impact'].map((i) => UploadItem.fromJson(i))) : null;
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
      impact: impact,
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

Future<CommonContainerList> fetchContainerProblemsPost() async {
  final response =  await http.get('http://10.0.2.2:3000/problems');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return problemToContainerList(ProblemsList.fromJson((json.decode(response.body))));  //returning JSON array not JSON object.
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

CommonContainerList problemToContainerList(ProblemsList problemsList) {
  List<dynamic> containers = problemsList.problems;
  List<CommonContainer> containerItems = [];
  int containerCount = 0;
  bool isProblem = true;

  for(ProblemItem item in problemsList.problemItems) {
    CommonContainer container = new CommonContainer(
      id: item.id,
      name: item.name,
      description: item.description,
      numLikes: item.numLikes,
      country: item.country,
      author: item.author,
      keywords: item.keywords,
      uploads: item.uploads,
      problemId: item.problemId,
      comments: item.comments,
      isProblem: true,
      impact: item.impact,
    );
    containerItems.add(container);
  }
  containerCount = containerItems.length;

  CommonContainerList returnList = new CommonContainerList();
  returnList.containers = containers;
  returnList.containerItems = containerItems;
  returnList.containerCount = containerCount;
  returnList.isProblem = isProblem;

  return returnList;
}