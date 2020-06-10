import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterclient/utilities/common_objects.dart';

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
  List<CommentItem> comments;

  SubmissionItem({this.id,this.name, this.description, this.numLikes, this.country, this.author, this.keywords, this.uploads, this.problemId, this.comments});

  factory SubmissionItem.fromJson(Map<String, dynamic> json) {
    List<String> keywords = List<String>.from(json['keywords'].map((i) => i.toString().toLowerCase()));
    List<UploadItem> uploads = List<UploadItem>.from(json['uploads'].map((i) => UploadItem.fromJson(i)));
    List<CommentItem> comments = json['comments'] != null ? List<CommentItem>.from(json['comments'].map((i) => CommentItem.fromJson(i))) : null;
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
      comments: comments,
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

Future<CommonContainerList> fetchContainerSubmissionsPost() async {
  final response =  await http.get('http://10.0.2.2:3000/submissions');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return submissionToContainerList(SubmissionsList.fromJson((json.decode(response.body))));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post submissions');
  }
}

Future<SubmissionsList> fetchTopSubmissionsPost(int count) async {
  final response =  await http.get('http://10.0.2.2:3000/submissions/highest/numlikes/' + count.toString());
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  String prettyprint = encoder.convert(response.body);
//  print(prettyprint);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return SubmissionsList.fromJson((json.decode(response.body)));  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post top submissions');
  }
}

Future<CommonContainer> fetchSolutionByName(String name) async {
  final response =  await http.get('http://10.0.2.2:3000/submissions/name/' + name);
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
//  print("response");
//  String prettyprint = encoder.convert(response.body);
//   print(prettyprint);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    CommonContainer item = CommonContainer.fromJson((json.decode(response.body)));
    return item;  //returning JSON array not JSON object.
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load solution by name');
  }
}

CommonContainerList submissionToContainerList(SubmissionsList submissionsList) {
  List<dynamic> containers = submissionsList.submissions;
  List<CommonContainer> containerItems = [];
  int containerCount = 0;
  bool isProblem = false;

  for(SubmissionItem item in submissionsList.submissionItems) {
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
      isProblem: false,
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