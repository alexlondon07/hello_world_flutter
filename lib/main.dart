import 'package:flutter/material.dart';
import 'widgets/maximum_offer.dart';
import 'widgets/shared_preferences_test.dart';

void main() => runApp(MySharedPreferences());

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
