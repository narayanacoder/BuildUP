import 'package:flutterclient/utilities/common_objects.dart';

List<UploadItem> getUploadImages(List<UploadItem> uploads) {
  List<UploadItem> returnList = [];
  for (UploadItem item in uploads) {
    if (item.type.toLowerCase() == "imageurl") {
        returnList.add(item);
    }
  }
  return returnList;
}

String getCoverImage(List<UploadItem> uploads) {
  List<UploadItem> returnList = [];
  for (UploadItem item in uploads) {
    if (item.type.toLowerCase() == "imageurl") {
      returnList.add(item);
    }
  }
  return returnList[0].imageUrl;
}

List<UploadItem> getUploadText(List<UploadItem> uploads) {
  List<UploadItem> returnList = [];
  for(UploadItem item in uploads){
    if(item.type.toLowerCase() == "text"){
      returnList.add(item);
    }
  }
  return returnList;
}

