import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),

              /// da rimuovere, serve solo a mostrare la tile al centro dello schermo in questa prova
              Container(
                child: TextField(
                  
                ),
              ),
              Expanded(
                child: Container(),
              ),

              /// da rimuovere, serve solo a mostrare la tile al centro dello schermo in questa prova
            ],
          ),
        ));
  }
}




//
// return ListTile(
// leading: CircleAvatar(
// child: Image.asset(imageReference),
// ),
// title: Text(
// title,
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// ),
// ),
// subtitle: Text(dealer),
// trailing: Column(
// children: [Text(actualAvailability), Spacer(), Text(sellingPrice)],
// ),
// );