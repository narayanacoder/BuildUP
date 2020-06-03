import 'package:bit/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:bit/screens/home_screens.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Color(0xff161616),
        body: Container(
            width: double.infinity,
            child: Stack(
                children: <Widget>[
                  Positioned(
                      top: -100,
                      left: 0,
                      child: FadeAnimation(1, Container(
                          width: width,
                          height: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/one.png'),
                                fit: BoxFit.cover,
                              )
                          )
                      ))
                  ),
                  Positioned(
                      top: -150,
                      left: 0,
                      child: FadeAnimation(1.3, Container(
                          width: width,
                          height: 400,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/one.png'),
                                fit: BoxFit.cover,
                              )
                          )
                      ))
                  ),
                  Positioned(
                    top: -200,
                    left: 0,
                    child: FadeAnimation(1.6, Container(
                        width: width,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/one.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: loginContent(),
                  ),
                ]
            )
        ),
    );
  }
}

/*

return Scaffold(
      backgroundColor: Color(0xff161616),
      body: Container(
        padding: EdgeInsets.all(30),
        child: loginContent(),
      ),
    );

 */

class loginContent extends StatelessWidget {
  const loginContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FadeAnimation(1.2, Text("Login",
          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
        SizedBox(height: 30,),
        FadeAnimation(1.5, Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey[300]))
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Email or Phone number"
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Password",
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
        )),
        SizedBox(height: 40,),
        Container(
          alignment: Alignment.center,
          child: SizedBox(width: 160,
            child:
            FadeAnimation(1.8, Center(
              child: RaisedButton(
                onPressed: () {Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen()));},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xff0062ff))
                ),
                color: Color(0xff0062ff),
                padding: EdgeInsets.all(15),
                child: Center(child: Text("Continue", style: TextStyle(color: Colors.white),)),
              ),
            )),
          ),
        ),
      ],
    );
  }
}