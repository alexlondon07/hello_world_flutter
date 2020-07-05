import 'package:flutter/material.dart';
import './maximum_offer.dart';

// StatefulWidget Example
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

// State of my StatefulWidget
class _MyState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello flutter'),
          ),
          body: Center(
            child: MaximumOffer(),
          ),
        ));
  }
}
