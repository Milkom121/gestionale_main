import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryJson {
  Inventory inventory = Inventory();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///questa variabile è un riferimento alla collection 'inventory' in firebase
  CollectionReference inventoryFirebaseCollection =
      FirebaseFirestore.instance.collection('Inventory');

  ///queste variabili invece si riferiscono ad un documento ('disposables' ,'ingredients'...) dentro la collection inventory
  DocumentReference disposablesDocument =
      FirebaseFirestore.instance.collection('Inventory').doc('Disposables');

  DocumentReference ingredientsDocument =
      FirebaseFirestore.instance.collection('Inventory').doc('Ingredients');

  DocumentReference resellingProductsDocument = FirebaseFirestore.instance
      .collection('Inventory')
      .doc('Resellig_Products');

  DocumentReference workToolsDocument =
      FirebaseFirestore.instance.collection('Inventory').doc('Work_Tools');

  DocumentReference serviceToolsDocument =
      FirebaseFirestore.instance.collection('Inventory').doc('Service_Tools');

  /// questa mappa contiene una copia dell'inventario completamente convertita in string, successivamente la convertirò in Json per il salvataggio su firebase
  Map<String, Map<String, String>> _inventoryAsMap = {};

  Map<String, Map<String, String>> get inventoryAsMap {
    return {..._inventoryAsMap};
  }



  ///metodo per aggiornare un elemento su Firebase, attualmente questa funzione viene svolta dallo stesso metodo gia esistente per la list inventory
  void updateElementOnFirebase(String id, modifiedElement) {
    if (modifiedElement is Disposable) {

      ///TODO compilare questa referenca con i dati dell'item da modificare
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Disposables').collection(modifiedElement.id).doc(modifiedElement.title)
          .set(Disposable.returnADisposableAsMap(modifiedElement));
    }
    if (modifiedElement is Ingredient) {
      ///modifico l'elemento nel database online
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Ingredients')
          .collection(modifiedElement.id).doc(modifiedElement.title)
          .set(Ingredient.returnAnIngredientAsMap(modifiedElement));
    }

    if (modifiedElement is ResellingProduct) {
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Reselling_Products')
          .collection(modifiedElement.id).doc(modifiedElement.title)
          .set(ResellingProduct.returnAResellingProductAsMap(modifiedElement));
    }
    if (modifiedElement is WorkTool ) {
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Work_Tools')
          .collection(modifiedElement.id).doc(modifiedElement.title)
          .set(WorkTool.returnAWorkToolAsMap(modifiedElement));
    }
    if (modifiedElement is ServiceTool) {
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Service_Tools')
          .collection(modifiedElement.id).doc(modifiedElement.title)
          .set(ServiceTool.returnAServiceToolAsMap(modifiedElement));
    }
  }




  ///metodo per salvare un elemento all'inventario Firebase
  Future<void> _addDataToFirebase(
      Map dataMap, savingPlaceReference, String nameOfTheInventoryList) async {
    DocumentReference ref =
        inventoryFirebaseCollection.doc(nameOfTheInventoryList);

    // NB: alla fine il gico si risolve tutto in collections che contengono documents che contengono collections etc... Quindi basta usare .doc('x').collection('y').doc('z').collection(...)...
    return savingPlaceReference
        .collection(dataMap['id'])
        .doc(dataMap['title'])
        .set(dataMap)
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add : $error"));
  }

  /// metodo per aggiungere nuovi elementi nelle liste corrette
  void addNewElementToCorrectFirebaseDocument(newElement) {
    if (newElement is Disposable) {
      //aggiungo l'elemento alla corretta collezione su Firebase
      _addDataToFirebase(
          Disposable.returnADisposableAsMap(newElement),
          disposablesDocument,
          'Disposables');

      print(newElement.id);
    }
    if (newElement is Ingredient) {
      _addDataToFirebase(
          Ingredient.returnAnIngredientAsMap(newElement),
          ingredientsDocument,
          'Ingredients');

      print(newElement.id);
    }
    if (newElement is ResellingProduct) {
      _addDataToFirebase(
          ResellingProduct.returnAResellingProductAsMap(newElement),
          resellingProductsDocument,
          'Reselling_Prdocucts');

      print(newElement.id);
    }
    if (newElement is ServiceTool) {
      _addDataToFirebase(
          ServiceTool.returnAServiceToolAsMap(newElement),
          workToolsDocument,
          'Work_Tools');

      print(newElement.id);
    }
    if (newElement is WorkTool) {
      _addDataToFirebase(WorkTool.returnAWorkToolAsMap(newElement),
          serviceToolsDocument, 'Service_Tools');

      print(newElement.id);
    }
  }


  void deleteItemOnFirebase (deletingElement) {

    if (deletingElement is Disposable) {
     disposablesDocument.collection(deletingElement.id).get().then((snapshot) {
       for (DocumentSnapshot ds in snapshot.docs){
         ds.reference.delete();
       };
     });
    }

    if (deletingElement is Ingredient) {
      ingredientsDocument.collection(deletingElement.id).get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs){
          ds.reference.delete();
        };
      });
    }

    if (deletingElement is ResellingProduct) {
      resellingProductsDocument.collection(deletingElement.id).get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs){
          ds.reference.delete();
        }
      });
    }

    //TODO per qualche motivo i ServiceTools ed i WoorkTools non vneogno eliminati da Firestore --> verificare e risolvere
    if (deletingElement is WorkTool) {
      workToolsDocument.collection(deletingElement.id).get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs){
          ds.reference.delete();
        };
      });
    }

    if (deletingElement is ServiceTool) {
      serviceToolsDocument.collection(deletingElement.id).get().then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs){
          ds.reference.delete();
        };
      });
    }




  }



  ///metodo per accomunare le list dell'inventory con la map su firebase
  //TODO: riscrivere questo metodo secondo la struttura innestata che ho impostato
  Future<void> fetchDataFromFirebase() async {
    // List fetchedList = [];
    //
    // await inventoryFirebaseCollection
    //     .where(FieldPath.documentId, isEqualTo: documentName)
    //     .get()
    //     .then((snapshot) {
    //   if (snapshot.docs.isNotEmpty) {
    //     snapshot.docs.asMap().forEach((key, value) {
    //       fetchedList.add(value);
    //       print(value.id);
    //       listInventory = fetchedList;
    //     });
    //   }
    // }).catchError((e) => print("error fetching data: $e"));
    //

    //TODO: questo di seguito non funziona
   disposablesDocument.snapshots().forEach((element) {
     print('ciao ${element.data()}');
   });




  }



}
