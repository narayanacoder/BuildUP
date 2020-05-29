import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bit/screens/explore_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 5, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SingleChildScrollView(child: ExploreScreen()),
            Container(),
            Container(),
            Container(),
            Container(),
          ]
        ),
        bottomNavigationBar: new Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[200],
                width: 1.0,
              ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: Color(0xff0062ff),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            unselectedLabelColor: Colors.grey[400],
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal
            ),
            indicatorColor: Colors.transparent,
            tabs: <Widget> [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.rocket,
                  size: 25,
                ),
                text: "EXPLORE",
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.lightbulb,
                  size: 25,
                ),
                text: "INNOVATE",
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.globeAmericas,
                  size: 25,
                ),
                text: "LOCAL",
              ),
              Tab(
                icon: Icon(
                  Icons.favorite_border,
                  size: 25,
                ),
                text: "SAVED",
              ),
              Tab(
                icon: Icon(
                  Icons.person_outline,
                  size: 25,
                ),
                text: "PROFILE",
              ),
            ]
          ),
        )
      )
    );
  }
}