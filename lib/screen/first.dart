import 'package:customtransaction/screen/second.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return StaggeredPageAnimation(transactionAnimation: animation);
                },
                transitionDuration: Duration(seconds: 1)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
