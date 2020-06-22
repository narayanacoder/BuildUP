import 'package:flutter/material.dart';
import 'package:flutterclient/screens/solution_contribution_screen.dart';

class ContributionScreen extends StatefulWidget {
  @override
  _ContributionScreenState createState() => new _ContributionScreenState();
}

class _ContributionScreenState extends State<ContributionScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(color: Colors.black),
            child: new TabBar(
              controller: _controller,
              labelColor: Color(0xff0062ff),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              unselectedLabelColor: Colors.grey[400],
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              indicatorColor: Color(0xff0062ff),
              tabs: [
                new Tab(
                  text: 'Solution',
                ),
                new Tab(
                  text: 'Problem',
                ),
              ],
            ),
          ),
          new Container(
              height: 800,
              child: new TabBarView(controller: _controller, children: <Widget>[
                SolutionContributionScreen(isSolution: true),
                SolutionContributionScreen(isSolution: false)
              ]))
        ],
      ),
    );
  }
}
