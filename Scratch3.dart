import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: AnimateExpanded(),
    );
  }
}


class AnimateExpanded extends StatefulWidget {
  @override
  _AnimateExpandedState createState() => new _AnimateExpandedState();
}

class _AnimateExpandedState extends State<AnimateExpanded> {
  double _bodyHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Card(
                child: new Container(
                  height: 50.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            this._bodyHeight = 300.0;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new AnimatedContainer(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.keyboard_arrow_up),
                        onPressed: () {
                          setState(() {
                            this._bodyHeight = 0.0;
                          });
                        },
                      ),
                    ],
                  ),
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                  height: _bodyHeight,
                  // color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}