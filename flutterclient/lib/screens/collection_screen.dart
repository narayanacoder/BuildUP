import 'package:flutter/material.dart';
import 'package:flutterclient/utilities/common_objects.dart';
import 'package:flutterclient/utilities/utility_helper.dart';
import 'package:flutterclient/api/api_users.dart';
import 'package:flutterclient/api/api_system.dart';
import 'package:flutterclient/api/api_submissions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterclient/animations/fade_animation.dart';

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
    return ProjectsListContainerWidget(context: context);
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
      return new FutureBuilder<User>(future: fetchCurrentUser(), builder: (context, snapshot){
        if(snapshot.hasData) {
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
                  ProjectItem(context: context, user: snapshot.data, isSubmitted: true),
                  SizedBox(height: 10,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 24, bottom: 5, top: 5),
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
                  ProjectItem(context: context, user: snapshot.data, isSubmitted: false),
                ],
              )
          );
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
    @required this.isSubmitted
  }) : super(key: key);

  final BuildContext context;
  final User user;
  final bool isSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
        future: isSubmitted ? fetchCurrentUserSubmitted() : fetchCurrentUserSaved(), //fetchSolutionByName(user.submitted[0]),
        builder: (BuildContext context, AsyncSnapshot<CommonContainerList> response) {
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
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image(
                            image: AssetImage(getCoverImage(response.data.containerItems[0].uploads)),
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(1, Container(
                              width: 90,
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: _buildIndicator(response.data.containerItems.length),
                              ),
                            ))
                          ],
                        ),
                      )],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                    response.data.containerItems[0].country, // response.data.country,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: Color(0xff171717).withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )
                                ),
                                !isSubmitted ? Row(
                                  children: <Widget>[
                                    Text(
                                        "4 more",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff0062ff)
                                        )
                                    ),
                                    SizedBox(width: 4,),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 11,
                                      color: Color(0xff0062ff),
                                    ),
                                  ],
                                ) : Container()
                              ]),
                          Text(
                              response.data.containerItems[0].name,
                              style: TextStyle( //response.data.name,
                                  fontSize: 16,
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


Widget _indicator(bool isActive) {
  return Expanded(
    child: Container(
      height: 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? Color(0xff0062ff) : Colors.black
      ),
    ),
  );
}

List<Widget> _buildIndicator(int length) {
  if(length == 0 || length == 1){
    return [];
  }

  List<Widget> indicators = [];
  for(int i = 0; i < length; i++) {
    if (0 == i) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }

  return indicators;
}