import 'package:flutter/material.dart';
import 'package:flutterclient/utilities/common_objects.dart';
import 'package:flutterclient/utilities/utility_helper.dart';
import 'package:flutterclient/api/api_users.dart';
import 'package:flutterclient/api/api_system.dart';
import 'package:flutterclient/api/api_submissions.dart';

class CollectionScreen extends StatefulWidget {
  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}


class _CollectionScreenState extends State<CollectionScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //TODO: maybe remove
        children: <Widget>[
          SizedBox(height: 15,),
          ProjectsListContainerWidget(context: context),
         ],
      )
    );
  }
}

class ProjectsListContainerWidget extends StatelessWidget {
  const ProjectsListContainerWidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
//    return ProjectItem(width: width);
      return new FutureBuilder<User>(future: fetchCurrentUser(), builder: (context, snapshot){
        if(snapshot.hasData) {
          return ProjectItem(context: context, user: snapshot.data);
        } else if (snapshot.hasError){
          print(snapshot.error);
          return new Container();
        } else {
          print("failed to get user for unknown reasons");
          return new Container();
        }
      });
  }
}



class ProjectItem extends StatelessWidget {
  const ProjectItem({
    Key key,
    @required this.context,
    @required this.user,
  }) : super(key: key);

  final BuildContext context;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
        future: fetchSolutionByName(user.submitted[0]),
        builder: (BuildContext context, AsyncSnapshot<CommonContainer> response) {
          if (!response.hasData){
            return new Container();
          } else if (response.hasError){
            print(response.error);
            return new Container();
          } else {
            return Container(
            height: 310,
            width: MediaQuery
                .of(context)
                .size
                .width - 40,
            margin: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5)),
                        child: Image(
                          image: AssetImage(getCoverImage(response.data.uploads)),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                    response.data.country,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: Color(0xff171717).withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )
                                ),
                              ]),
                          Text(
                              response.data.name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff171717)
                              )
                          ),
                          SizedBox(height: 2,),
                          Text(
                              "4 more",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff171717)
                              )
                          ),
                        ]
                    )
                )
              ],
            )
        );
          }
        }
      )
    );
  }
}