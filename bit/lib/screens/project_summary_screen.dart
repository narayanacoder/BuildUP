import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bit/api/api_submissions.dart';
import 'package:bit/api/api_problems.dart';
import 'package:bit/utilities/common_objects.dart';
import 'package:bit/utilities/constants.dart';

class ProjectSummaryPage extends StatefulWidget {
  const ProjectSummaryPage({
    Key key,
    @required this.context,
    @required this.togglePage,
    @required this.container,
  }) : super(key: key);

  final BuildContext context;
  final Function togglePage;
  final CommonContainer container;

  @override
  _ProjectSummaryPage createState() => _ProjectSummaryPage();
}

class _ProjectSummaryPage extends State<ProjectSummaryPage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Container(
              width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                  child: Image(
                      image: AssetImage(widget.container.uploads[0].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  )
            ),
            Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.togglePage(ExplorePage_Tab.explore_tab, widget.container.isProblem);
                            },
                            child: Container(
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xff0062ff),
                                size: 45,
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 24,
                          ),
                          ClipOval(
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor: Colors.red, // inkwell color
                                child: SizedBox(width: 46, height: 45, child: Icon(
                                  FontAwesomeIcons.heart,
                                  size: 27,
                                  color: Color(0xff0062ff),
                                ),),
                                onTap: () {}, //Like
                              ),
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                )
            ),
          ]
        ),
        Container(
          transform: Matrix4.translationValues(0.0, -29.0, 0.0),
          width: MediaQuery.of(context).size.width,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          transform: Matrix4.translationValues(0.0, -30.0, 0.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        widget.container.country,
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Color(0xff171717).withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.bookmark,
                          size: 12,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 2,),
                        Text(
                          " Save",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff171717)
                          ),
                        ),
                        SizedBox(width: 12,),
                        Icon(
                          FontAwesomeIcons.shareAlt,
                          size: 12,
                          color: Colors.blueGrey.withOpacity(0.8),
                        ),
                        SizedBox(width: 2,),
                        Text(
                          " Share",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff171717)
                          ),
                        ),
                        SizedBox(width: 12,),
                        Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 13,
                          color: Color(0xff0062ff),
                        ),
                        SizedBox(width: 2,),
                        Text(
                          " " + widget.container.numLikes.toString(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff171717)
                          ),
                        ),
                        SizedBox(width: 8,),
                      ],
                    )
                  ]),
              SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    widget.container.name,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Text(
                widget.container.description,
                style: TextStyle(
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
