import 'package:flutter/material.dart';
/// Progress indicator to display whether we need to wait for data from database
/// or other source
class MyProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
            SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
      ),
            Text(
              "Loading data...",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center, )
    ],)]
    );
  }
}
