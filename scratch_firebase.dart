
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'lib/data/inventory.dart';



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



    List disposables =[];

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    ///questa variabile è un riferimento alla collection 'inventory' in firebase
    CollectionReference inventoryFirebaseCollection =
    FirebaseFirestore.instance.collection('Inventory');

    Future<void> fetchDataFromFirebase(String documentName , List listInventory) async {

      List fetchedList = [];

      await inventoryFirebaseCollection
          .where(FieldPath.documentId, isEqualTo: documentName)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          snapshot.docs.asMap().forEach((key, value) {
            fetchedList.add(value);
            print(value.id);
            listInventory = fetchedList;
          });
        }
      }).catchError((e) => print("error fetching data: $e"));


      //   StreamBuilder(
      //       stream: FirebaseFirestore.instance
      //           .collection('YOUR COLLECTION NAME')
      //           .doc(id) //ID OF DOCUMENT
      //           .snapshots(),
      //       builder: (context, snapshot) {
      //         if (!snapshot.hasData) {
      //           return new CircularProgressIndicator();
      //         }
      //         var document = snapshot.data;
      //         return new Text(document["name"]);
      //       }
      //   );
      // }


    }

    fetchDataFromFirebase('Disposables', disposables);






    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Container(child: Center(child: Text(disposables[0].id),),)
    );
  }
}




























