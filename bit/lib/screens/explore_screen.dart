import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            height: 400.0,
            child: ListView(
              children: <Widget>[
                buildFilterWidget(),
                Container(
                  height: 250,
                  color: Colors.transparent, //TODO: Or Colors.black12
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Browse COVID submissions",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0
                        )
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          height: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                width: 140,
                                margin: index == 0 ? EdgeInsets.only(left:16, right: 16, top: 4, bottom: 4) : EdgeInsets.only(right: 16, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200],
                                      offset: Offset(0.0, 4.0),
                                      blurRadius: 4
                                    )
                                  ]
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      child: Text(
                                        "Submission Name",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[800]
                                        )
                                      )
                                    )
                                  ],
                                )
                              );
                            }
                          )
                        )
                      )
                    ],
                  )
                )
            ]
          )
        )
       ]
    )
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
}