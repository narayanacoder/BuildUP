import 'package:flutter/material.dart';
import 'package:bit/models/all_submissions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Container ProjectsWidget(BuildContext context, togglePage) {
    String searchTerm = "";
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //TODO: maybe remove
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16, left:16, right: 16, bottom: 4),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: Offset(0.0, 1.0),
                  blurRadius: 4
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Browse submissions",
                  alignLabelWithHint: true,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
                  prefixIcon: Icon(Icons.search)
              ),
            )
          ),
          Container( //TODO: use Expanded?
              height: 550.0,
              child: ListView(
                children: <Widget>[
                  buildFilterWidget(),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(top: 24, left: 16),
                    child:
                    Text(
                      "Found " + submissions.length.toString() + " submissions",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'roboto',
                        color: Color(0xff171717),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  buildProjectsListWidget(context),
              ]
            ),
          ),
         ],
      )
    );
  }

Container buildProjectsListWidget(BuildContext context) {
  final double width = MediaQuery
      .of(context)
      .size
      .width;
  return Container(
    height: (300 * submissions.length.toDouble()) + (56 * submissions.length.toDouble()),
    child: Column(
        children: submissions
            .map((submission) => Container(
          child: Column(
            children: <Widget>[
                Container(
                  height: 310,
                  width: width - 40,
                  margin: EdgeInsets.only(right: 16, left: 16, top: 8, bottom: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                                child: Image(
                                  image: AssetImage(submission.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              )
                          )
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
                                      submission.country,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        color: Color(0xff171717).withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      )
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.solidHeart,
                                        size: 12,
                                        color: Colors.redAccent,
                                      ),
                                      SizedBox(width: 2,),
                                      Text(
                                        " " + submission.numLikes,
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff171717)
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                    ],
                                  )
                                ]),
                                Text(
                                    submission.submissionName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff171717)
                                    )
                                ),
                                SizedBox(height: 2,),
                                Text(
                                    submission.description,
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
              )

            ],
          ),
        ))
      .toList()),
  );
}

Container buildFilterWidget() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[300],
                      width: 1.0,
                    )
                ),
                child: Text("Covid")
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[300],
                      width: 1.0,
                    )
                ),
                child: Text("Parks")
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey[300],
                      width: 1.0,
                    )
                ),
                child: Text("Forest Fires")
            )
          ]
      )
  );
}