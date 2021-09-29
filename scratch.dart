///https://github.com/flutter/flutter/issues/38640




import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color:
                  index % 2 == 0 ? Colors.amber[100] : Colors.blue[100],
                );
              },
              childCount: 7,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            // fillOverscroll: true, // Set true to change overscroll behavior. Purely preference.
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: Text('Bottom'),
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}