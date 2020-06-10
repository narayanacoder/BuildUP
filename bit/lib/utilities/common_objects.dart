//Common class objects

class UploadItem {
  String type;
  String imageUrl;
  String text;

  UploadItem({this.type,this.imageUrl, this.text});

  factory UploadItem.fromJson(Map<String, dynamic> json) {
    return UploadItem(
      type: json['type'],
      imageUrl: json['imageUrl'],
      text: json['text']
    );
  }
}

class CommentItem {
  String author;
  String comment;
  int numLikes;

  CommentItem({this.author,this.comment, this.numLikes});

  factory CommentItem.fromJson(Map<String, dynamic> json) {
    return CommentItem(
      author: json['author'],
      comment: json['comment'],
      numLikes: json['numLikes']
    );
  }
}

class CommonContainer {
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
  bool isProblem;
  List<UploadItem> impact;
  //TODO: add deadline field

  CommonContainer({this.id,this.name, this.description, this.numLikes, this.country, this.author, this.keywords, this.uploads, this.problemId, this.comments, this.isProblem, this.impact});

  factory CommonContainer.fromJson(Map<String, dynamic> json) {
    List<String> keywords = List<String>.from(json['keywords'].map((i) => i.toString().toLowerCase()));
    List<UploadItem> uploads = List<UploadItem>.from(json['uploads'].map((i) => UploadItem.fromJson(i)));
    List<CommentItem> comments = json['comments'] != null ? List<CommentItem>.from(json['comments'].map((i) => CommentItem.fromJson(i))) : [];
    List<UploadItem> impact = json['impact'] != null ? List<UploadItem>.from(json['impact'].map((i) => UploadItem.fromJson(i))) : [];
    bool isProblem = false;
    return CommonContainer(
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
      isProblem: isProblem,
      impact: impact
    );
  }
}


class CommonContainerList {
  List<dynamic> containers = []; //contains full json object.
  List<CommonContainer> containerItems = [];
  int containerCount = 0;
  bool isProblem;

  CommonContainerList({this.containers, this.containerItems, this.containerCount, this.isProblem});

  factory CommonContainerList.fromJson(List<dynamic> json) { //Map<String, dynamic>  if its an object.
    List<CommonContainer> list = List<CommonContainer>.from(json.map((i) => CommonContainer.fromJson(i)));
    bool isProblem = false;
    return CommonContainerList(
        containers: json,
        containerItems: list,
        containerCount: list.length,
        isProblem: isProblem,
    );
  }
}
