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
              WarehouseItemTile(
                imageReference: 'assets/images/mainsummer_logo.png',
                title: 'ciao',
                sellingPrice: '12',
                dealer: '4',
                actualAvailability: '100',
                maxSupply: '1000',
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

class WarehouseItemTile extends StatelessWidget {
  WarehouseItemTile({
    required this.imageReference,
    required this.title,
    required this.sellingPrice,
    required this.dealer,
    required this.actualAvailability,
    required this.maxSupply,
  });

  final String imageReference;
  final String title;
  final String sellingPrice;
  final String dealer;
  final String actualAvailability;
  final String maxSupply;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Expanded(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                child: Image.asset(imageReference),
              ),
            ),
            SizedBox(width: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10,),

                Text('€ $sellingPrice'),


              ],
            ),

            Expanded(child: SizedBox()),



            Column(

              children: [
                SizedBox(height: 8,),
                Text('Availability'),
                SizedBox(height: 10,),
                Text(actualAvailability),
              ],
            ),

            SizedBox(width: 20,)
          ],
        ),
      ),
    );
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