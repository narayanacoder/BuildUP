import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bit/api/api_submissions.dart';
import 'package:bit/api/api_problems.dart';
import 'package:bit/utilities/common_objects.dart';
import 'package:bit/utilities/constants.dart';
import 'package:bit/utilities/utility_helper.dart';
import 'package:bit/components/StackedHorizontalBarChart.dart';
import 'package:bit/components/SolutionSummary.dart';

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

  List<bool> isSelected;


  @override
  void initState() {
    //TODO: implement initState
    isSelected = [true, false, false];
    super.initState();
  }

  Widget _buildComment(CommentItem commentItem) {
    return Column(
      children: [
        Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          leading: Container(
            width: 38.0,
            height: 38.0,
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
          subtitle: Column(children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(commentItem.comment)),
            Align(
                alignment: Alignment.centerLeft,
                child:Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      transform: Matrix4.translationValues(-14.0, 0.0, 0.0),
                      child: IconButton(
                        iconSize: 18,
                        icon: Icon(
                          Icons.favorite_border,
                        ),
                        color: Color(0xff0062ff),
                        onPressed: () => print('Like comment'),
                      )
                  ),
                  Container(
                    transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                    child: Text(
                      commentItem.numLikes.toString(),
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff171717)
                      ),
                    ),
                  ),
              ])),
          ]),
        ),
      ),
      ],
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
              if(!widget.container.isProblem && widget.container.problemId != null && widget.container.problemId != 0)
                SizedBox(height: 16,),
              if(!widget.container.isProblem && widget.container.problemId != null && widget.container.problemId != 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                        "Solution for problem:",
                        style: TextStyle(
                          color: Color(0xff171717),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                  ),
                ),
              if(!widget.container.isProblem && widget.container.problemId != null && widget.container.problemId != 0)
                FutureBuilder(
                    future: fetchProblemByProblemId(widget.container.problemId),
                    builder: (BuildContext context, AsyncSnapshot<ProblemItem> response) {
                      if (!response.hasData){
                        return new Container();
                      } else {
                        return (
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                  (response.data.name),
                                  style: TextStyle(
                                    color: Color(0xff0062ff),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  )
                              ),
                            ),
                          )
                        );
                      }
                    }
                ),
//              if(!widget.container.isProblem &&widget.container.problemId != null && widget.container.problemId != 0)
//                buildProblemPreviewWidget(),
              SizedBox(height: 26,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child:
                  Text(
                    widget.container.description,
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
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
        if(getUploadImages(widget.container.uploads).length >= 2)
          buildUploadImagesWidget(),
        if(widget.container.isProblem == false)
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
              child: ToggleButtons(
                  borderColor: Color(0xff171717).withOpacity(0.1),
                  fillColor: Color(0xff0062ff),
                  borderWidth: 1,
//                  renderBorder: false,
                  borderRadius: BorderRadius.circular(6),
                  selectedBorderColor: Color(0xff0062ff),
                  selectedColor: Colors.white,
                  color: Color(0xff171717),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        'All Reviews',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        'Sentiment',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        'Summary',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
              SizedBox(height: 25.0),
              if(isSelected[2] == true)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child:
                    Text(
                      "Summary of solution and reviews:",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Color(0xff171717).withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              if(isSelected[2] == true)
                SizedBox(height: 16.0),
              if(isSelected[2] == true)
                SolutionSummary.withSampleData(),
              if(isSelected[1] == true)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child:
                    Text(
                      "Review Insights:",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Color(0xff171717).withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              if(isSelected[1] == true && widget.container.comments != null && widget.container.comments.length > 0)
                SizedBox(
                  width: 240.0,
                  height: 130.0,
                  child: StackedHorizontalBarChart.withSampleData(),
                ),
              if(isSelected[0] == true)
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child:
                  Text(
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
              if(isSelected[0] == true)
                SizedBox(height: 16.0),
              if(isSelected[0] == true && widget.container.comments != null && widget.container.comments.length > 0)
              if (widget.container.comments != null)
                for (CommentItem commentItem in widget.container.comments)
                  _buildComment(commentItem)
              ,SizedBox(height: 60.0),
            ],
          ),
        ),
//        if(widget.container.isProblem == true && widget.container.impact != null && widget.container.impact.length >= 1)
//          buildImpactWidget()
      ],
    );
  }

  Container buildUploadImagesWidget() {
    return Container(
        height: 300,
        padding: EdgeInsets.only(bottom: 30, top: 0, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    height: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getUploadImages(widget.container.uploads).length,
                        itemBuilder: (BuildContext context, int index){
                          UploadItem uploadImg = getUploadImages(widget.container.uploads)[index];
                          return (index == 0) ? Container() : Container(
                              width: 160,
                              margin: index == 0 ? EdgeInsets.only(right: 16, top: 4, bottom: 12) : EdgeInsets.only(right: 16, top: 4, bottom: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[850],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image(
                                              image: AssetImage(uploadImg.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                      )
                                  ),
                                ],
                              )
                          );
                        }
                    )
                )
            ),
          ],
        )
    );
  }


  Container buildProblemPreviewWidget() {
    return
      Container(
        child: FutureBuilder(
          future: fetchProblemByProblemId(widget.container.problemId),
          builder: (BuildContext context, AsyncSnapshot<ProblemItem> response) {
            if (!response.hasData){
              return new Container();
            } else {
              return Align(
                alignment: Alignment.centerLeft,
                child: (
                    Container(
                        transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                        height: 90,
                        padding: EdgeInsets.only(bottom: 20, top: 0, left: 0),
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            height: 90,
                            child: Container(
                                width: 82,
                                margin: EdgeInsets.only(right: 16, top: 4, bottom: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image(
                                                image: AssetImage(getCoverImage(response.data.uploads)),
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                        )
                                    ),
                                  ],
                                )
                            )
                        )
                    )
                ),
              );
            }
          }
        ),
      );
  }

  Container buildImpactWidget() {
    return Container(
        height: 220,
        padding: EdgeInsets.only(bottom: 30, top: 0, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    height: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getUploadImages(widget.container.impact).length,
                        itemBuilder: (BuildContext context, int index){
                          UploadItem uploadImg = getUploadImages(widget.container.impact)[index];
                          return Container(
                              width: 300,
                              margin: index == 0 ? EdgeInsets.only(right: 16, top: 4, bottom: 12) : EdgeInsets.only(right: 16, top: 4, bottom: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[850],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image(
                                              image: AssetImage(uploadImg.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                      )
                                  ),
                                ],
                              )
                          );
                        }
                    )
                )
            ),
          ],
        )
    );
  }
}
