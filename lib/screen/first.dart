import 'package:customtransaction/screen/second.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Second()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
