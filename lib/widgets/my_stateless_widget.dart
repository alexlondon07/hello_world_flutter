import 'package:flutter/material.dart';

// StatelessWidget Example
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello flutter'),
          ),
          body: Center(
            child: Text('Hello world from StatelessWidget'),
          ),
        ));
  }
}
