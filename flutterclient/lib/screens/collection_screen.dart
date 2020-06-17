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
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, bottom: 5),
              child: Text(
                  "Your solutions",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff171717),
                    fontWeight: FontWeight.w600,
                ),
              ),
            )
          ),
          ProjectsListContainerWidget(context: context),
          SizedBox(height: 10,),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 24, bottom: 5),
                child: Text(
                  "Saved",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff171717),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
          ),
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
            height: 220,
            width: MediaQuery
                .of(context)
                .size
                .width - 40,
            margin: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
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