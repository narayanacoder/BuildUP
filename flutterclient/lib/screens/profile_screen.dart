import 'package:flutter/material.dart';
import 'package:flutterclient/api/api_users.dart';
import 'package:flutterclient/api/api_system.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatelessWidget {

  final List tags = ["Instagram", "Facebook", "Linkedin"];

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<User>(future: fetchCurrentUser(), builder: (context, snapshot){
      if(snapshot.hasData){
      return Scaffold(
        backgroundColor: Color(0xff09031D),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff09031D),
          title: Text("User Profile", style: TextStyle(color: Colors.white),),
          leading: Icon(Icons.arrow_back_ios),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            // Profile info
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, top: 7.0),
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage("images/userIcon.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(snapshot.data.firstName + " " + snapshot.data.lastName, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          color: Colors.white),),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                                Icons.location_on, color: Colors.white, size: 17),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(snapshot.data.country, style: TextStyle(
                                color: Colors.white, letterSpacing: 3,),),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 8.0),

            // Follow..
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("2M", style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),),
                      Text("followers",
                        style: TextStyle(color: Colors.white70, fontSize: 12.0),),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: 22.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("463", style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),),
                      Text("following",
                        style: TextStyle(color: Colors.white70, fontSize: 12.0),),
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    width: 0.2,
                    height: 22.0,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(33)),
                        gradient: LinearGradient(
                          colors:  [Color(0xff0062ff), Color(0xff33b1ff)],
                          begin: Alignment.bottomRight,
                          end: Alignment.centerLeft,
                        )
                    ),
                    child: Text("Follow", style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 16.5),),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.0),

            // Tags
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white12)
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(23, 9, 23, 4),
                      child: Text(
                        tags[index], style: TextStyle(color: Colors.white),),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 8.0),

            // Gallery
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                  color: Color(0xfff4f4f4),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34),),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    //   child: Text("Portfolio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    // ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Username',
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 18.0)),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data.username,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(
                              FontAwesomeIcons.pen,
                              color: Color(0xff0062ff),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Phone number',
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 18.0)),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data.phoneNumber.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(
                              FontAwesomeIcons.pen,
                              color: Color(0xff0062ff),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Location',
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 18.0)),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data.country,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(
                              FontAwesomeIcons.pen,
                              color: Color(0xff0062ff),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
        return Scaffold();
      }
    }
    );
  }
}