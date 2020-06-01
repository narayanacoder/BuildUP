import 'package:bit/animations/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bit/screens/login_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );

    _scaleAnimation = Tween<double>(
        begin: 1.0, end: 0.8
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _widthController.forward();
      }
    });

    _widthController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600)
    );

    _widthAnimation = Tween<double>(
        begin: 80.0,
        end: 300.0
    ).animate(_widthController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _positionController.forward();
      }
    });

    _positionController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 600)
    );

    _positionAnimation = Tween<double>(
        begin: 0.0,
        end: 215.0
    ).animate(_positionController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          hideIcon = true;
        });
        _scale2Controller.forward();
      }
    });

    _scale2Controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );

    _scale2Animation = Tween<double>(
        begin: 1.0,
        end: 32.0
    ).animate(_scale2Controller)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: LoginPage()));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            width: double.infinity,
            child: Stack(
                children: <Widget>[
              Positioned(
                  top: -140,
                  left:-2,
                  child: FadeAnimation(1,Container(
                      padding: EdgeInsets.only(
                        right: width + 10,
                        top: 50,
                      ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 420,
                          ),
                          Row(),
                        ]),
                  ))),
                  Positioned(
                      top: 50,
                      right: -165,
                      child: FadeAnimation(1, Container(
                          width: 540,
                          height: 505,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/cooperateBackground.png'),
                                fit: BoxFit.cover,
                              )
                          )
                      ))
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1, Text("Welcome",
                          style: TextStyle(color: Colors.white, fontSize: 50),)),
                          SizedBox(height: 15,),
                          FadeAnimation(1.3, Text("Let us help you take care of each other. \nWe'll do our best.",
                            style: TextStyle(color: Colors.white.withOpacity(.7), height: 1.4, fontSize: 20),)),
                            SizedBox(height: 80,),
                            FadeAnimation(1.6, AnimatedBuilder(
                              animation: _scaleController,
                              builder: (context, child) => Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: _widthController,
                                    builder: (context, child) => Container(
                                      width: _widthAnimation.value,
                                      height: 80,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff0062ff).withOpacity(.4)
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          _scaleController.forward();
                                        },
                                        child: Stack(
                                          children: <Widget>[
                                            AnimatedBuilder(
                                              animation: _positionController,
                                              builder: (context, child) => Positioned(
                                                left: _positionAnimation.value,
                                                child: AnimatedBuilder(
                                                  animation: _scale2Controller,
                                                  builder: (context, child) => Transform.scale(
                                                    scale: _scale2Animation.value,
                                                    child: Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xff0062ff),
                                                      ),
                                                      child: hideIcon == false ? Icon(Icons.arrow_forward, color: Colors.white,) : Container(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                        )
                                      )
                                ),
                                ),
                              ))
                            )),
                        SizedBox(height: 0,),
                      ],
                    )
                  ),
                ]
            )
        )
    );
  }
}


/*
Deprecated code, may reuse elsewhere.
Use example:

ClipPath(
    clipper: CurvedRectangleClipper(),
    child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [Color(0xff0062ff).withOpacity(0.7), Colors.deepPurple.withOpacity(0.18), Colors.purple.withOpacity(0.01)])),
        padding: EdgeInsets.only(
          right: 50,
          top: 50,
           ),
      child: (YOUR WIDGET)
 */
class CurvedRectangleClipper extends CustomClipper<Path> {
  final double offset = 130;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - offset);
    var firstEndpoint = Offset(offset, size.height);
    path.arcToPoint(firstEndpoint, radius: Radius.circular(-offset),clockwise: false);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, offset);
    path.lineTo(offset, offset);

    var secondEndPoint = Offset(0,0);

    path.arcToPoint(secondEndPoint, radius: Radius.circular(-offset),clockwise: true);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}