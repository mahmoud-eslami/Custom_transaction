import 'package:flutter/material.dart';

class StaggeredPageAnimation extends StatelessWidget {
  final Animation<double> transactionAnimation;

  const StaggeredPageAnimation({Key key, @required this.transactionAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Back'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: transactionAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(transactionAnimation),
                child: child,
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.purple,
            ),
          ),
          AnimatedBuilder(
            animation: transactionAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(transactionAnimation),
                child: child,
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.amber,
            ),
          ),
          AnimatedBuilder(
            animation: transactionAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(transactionAnimation),
                child: child,
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.purple,
            ),
          ),
          AnimatedBuilder(
            animation: transactionAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(transactionAnimation),
                child: child,
              );
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
