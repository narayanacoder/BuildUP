import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bit/api/api_submissions.dart';
import 'package:bit/api/api_problems.dart';
import 'package:bit/utilities/common_objects.dart';
import 'package:bit/utilities/constants.dart';
import 'package:bit/utilities/utility_helper.dart';

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

  Widget _buildComment(CommentItem commentItem) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
        leading: Container(
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black45.withOpacity(0.1),
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 40.0,
                width: 40.0,
                image: AssetImage("images/userIcon.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          commentItem.author,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(commentItem.comment),
        trailing: IconButton(
          iconSize: 22,
          icon: Icon(
            Icons.favorite_border,
          ),
          color: Color(0xff0062ff),
          onPressed: () => print('Like comment'),
        ),
      ),
    );
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
                  child: Image(
                      image: AssetImage(getCoverImage(widget.container.uploads)),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    (widget.container.isProblem ? "Contributor: " : "Innovator: ") + widget.container.author,
                      style: TextStyle(
                        color: Color(0xff0062ff).withOpacity(0.6),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ),
              ),
              SizedBox(height: 26,),
              Text(
                widget.container.description,
                style: TextStyle(
                  height: 1.5,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    for (UploadItem item in getUploadText(widget.container.uploads) )
                      Column(
                        children: <Widget>[
                          SizedBox(height: 26,),
                          Text(
                            item.text,
                            style: TextStyle(
                              height: 1.5,
                            ),
                          ),
                        ]
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24),
          transform: Matrix4.translationValues(0.0, 0.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Reviews:",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Color(0xff171717).withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              if (widget.container.comments != null)
                for (CommentItem commentItem in widget.container.comments)
                  _buildComment(commentItem)
            ],
          ),
        )
      ],
    );
  }
}
