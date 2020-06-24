import 'package:flutter/material.dart';

class StaggeredPageAnimation extends StatelessWidget {
  final Animation<double> transactionAnimation;

  const StaggeredPageAnimation({Key key, @required this.transactionAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('BackToOldLayer'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: MySlideAnimation(
              beginDx: 1,
              beginDy: 0,
              endDx: 0,
              endDy: 0,
              startInterval: 0,
              endInterval: .25,
              curvesAnimation: Curves.easeInOut,
              transactionAnimation: transactionAnimation,
              mainChild: Container(
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'SlideTransaction',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: MySlideAnimation(
              beginDx: -1,
              beginDy: 0,
              endDx: 0,
              endDy: 0,
              startInterval: 0.25,
              endInterval: .5,
              curvesAnimation: Curves.easeInOut,
              transactionAnimation: transactionAnimation,
              mainChild: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: CircleAvatar(
                      maxRadius: 60,
                      child: Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                      backgroundColor: Colors.amber,
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: MySlideAnimation(
              beginDx: 1,
              beginDy: 0,
              endDx: 0,
              endDy: 0,
              startInterval: 0.5,
              endInterval: .75,
              curvesAnimation: Curves.easeInOut,
              transactionAnimation: transactionAnimation,
              mainChild: Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorMaxLines: 1,
                              helperMaxLines: 1,
                              labelText: 'Username',
                              labelStyle: TextStyle(color: Colors.amber.withOpacity(.5),fontSize: 12),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              errorMaxLines: 1,
                              helperMaxLines: 1,
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.amber.withOpacity(.5),fontSize: 12),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: MySlideAnimation(
              beginDx: 0,
              beginDy: 4,
              endDx: 0,
              endDy: 0,
              startInterval: 0.75,
              endInterval: 1,
              curvesAnimation: Curves.easeInOut,
              transactionAnimation: transactionAnimation,
              mainChild: Container(
                width: double.infinity,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Register',
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySlideAnimation extends StatelessWidget {
  final Animation<double> transactionAnimation;
  final double beginDx;
  final double beginDy;
  final double endDx;
  final double endDy;
  final double startInterval;
  final double endInterval;
  final Curve curvesAnimation;
  final Widget mainChild;

  const MySlideAnimation(
      {Key key,
      this.transactionAnimation,
      this.beginDx,
      this.beginDy,
      this.endDx,
      this.endDy,
      this.startInterval,
      this.endInterval,
      this.curvesAnimation,
      this.mainChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transactionAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
                  begin: Offset(beginDx, beginDy), end: Offset(endDx, endDy))
              .animate(
            CurvedAnimation(
                curve: Interval(startInterval, endInterval,
                    curve: curvesAnimation),
                parent: transactionAnimation),
          ),
          child: child,
        );
      },
      child: mainChild,
    );
  }
}
