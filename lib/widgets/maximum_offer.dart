import 'package:flutter/material.dart';

class MaximumOffer extends StatefulWidget {
  @override
  _MaximumOffer createState() => _MaximumOffer();
}

class _MaximumOffer extends State<MaximumOffer> {
  double _MaxOffer = 0.0;

  void _increaseMyMaxOffer() {
    setState(() {
      _MaxOffer += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('My Maximum Offer: $_MaxOffer'),
        FlatButton.icon(
            onPressed: () => _increaseMyMaxOffer(),
            icon: Icon(Icons.add_circle),
            label: Text('Increase Offer'))
      ],
    );
  }
}
