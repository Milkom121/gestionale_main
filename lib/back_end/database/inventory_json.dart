import 'package:cloud_firestore/cloud_firestore.dart';
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
  CollectionReference _disposablesCollection =
  FirebaseFirestore.instance.collection('Inventory')
      .doc('Disposables')
      .collection('DisposablesCollection');

  CollectionReference ingredientsCollection =
  FirebaseFirestore.instance.collection('Inventory')
      .doc('Ingredients')
      .collection('IngredientsCollection');

  CollectionReference resellingProductsCollection = FirebaseFirestore.instance
      .collection('Inventory')
      .doc('ResellingProducts').collection('ResellingProductsCollection');

  CollectionReference workToolsCollection =
  FirebaseFirestore.instance.collection('Inventory')
      .doc('WorkTools')
      .collection('WorkToolsCollection');

  CollectionReference serviceToolsCollection =
  FirebaseFirestore.instance.collection('Inventory')
      .doc('ServiceTools')
      .collection('ServiceToolsCollection');

  /// questa mappa contiene una copia dell'inventario completamente convertita in string, successivamente la convertirò in Json per il salvataggio su firebase
  Map<String, Map<String, String>> _inventoryAsMap = {};

  Map<String, Map<String, String>> get inventoryAsMap {
    return {..._inventoryAsMap};
  }


  ///metodo per aggiornare un elemento su Firebase, attualmente questa funzione viene svolta dallo stesso metodo gia esistente per la list inventory
  void updateElementOnFirebase(String id, modifiedElement) {
    if (modifiedElement is Disposable) {

      ///TODO compilare questa referenca con i dati dell'item da modificare
      _disposablesCollection.doc(modifiedElement.id)
          .set(Disposable.returnADisposableAsMap(modifiedElement));
    }
    if (modifiedElement is Ingredient) {
      ///modifico l'elemento nel database online
      ingredientsCollection.doc(modifiedElement.id)
          .set(Ingredient.returnAnIngredientAsMap(modifiedElement));
    }

    if (modifiedElement is ResellingProduct) {
      resellingProductsCollection.doc(modifiedElement.id)
          .set(ResellingProduct.returnAResellingProductAsMap(modifiedElement));
    }
    if (modifiedElement is WorkTool) {
      workToolsCollection.doc(modifiedElement.id)
          .set(WorkTool.returnAWorkToolAsMap(modifiedElement));
    }
    if (modifiedElement is ServiceTool) {
      serviceToolsCollection.doc(modifiedElement.title)
          .set(ServiceTool.returnAServiceToolAsMap(modifiedElement));
    }
  }


  ///metodo per salvare un elemento all'inventario Firebase
  Future<void> _addDataToFirebase(Map dataMap, savingPlaceReference,
      String nameOfTheInventoryList) async {
    DocumentReference ref =
    inventoryFirebaseCollection.doc(nameOfTheInventoryList);

    // NB: alla fine il gico si risolve tutto in collections che contengono documents che contengono collections etc... Quindi basta usare .doc('x').collection('y').doc('z').collection(...)...
    return savingPlaceReference
        .doc(dataMap['id'])
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
          _disposablesCollection,
          'Disposables');

      print(newElement.id);
    }
    if (newElement is Ingredient) {
      _addDataToFirebase(
          Ingredient.returnAnIngredientAsMap(newElement),
          ingredientsCollection,
          'Ingredients');

      print(newElement.id);
    }
    if (newElement is ResellingProduct) {
      _addDataToFirebase(
          ResellingProduct.returnAResellingProductAsMap(newElement),
          resellingProductsCollection,
          'Reselling_Prdocucts');

      print(newElement.id);
    }
    if (newElement is ServiceTool) {
      _addDataToFirebase(
          ServiceTool.returnAServiceToolAsMap(newElement),
          serviceToolsCollection, 'Service_Tools');


      print(newElement.id);
    }
    if (newElement is WorkTool) {
      _addDataToFirebase(WorkTool.returnAWorkToolAsMap(newElement),
          workToolsCollection,
          'Work_Tools');

      print(newElement.id);
    }
  }


  void deleteItemOnFirebase(deletingElement) {
    if (deletingElement is Disposable) {
      _disposablesCollection.doc(deletingElement.id).delete();
    }


    if (deletingElement is Ingredient) {
      ingredientsCollection.doc(deletingElement.id).delete();
    }

    if (deletingElement is ResellingProduct) {
      resellingProductsCollection.doc(deletingElement.id).delete();
    }

    //TODO per qualche motivo i ServiceTools ed i WoorkTools non vneogno eliminati da Firestore --> verificare e risolvere
    if (deletingElement is WorkTool) {
      workToolsCollection.doc(deletingElement.id).delete();
    }

    if (deletingElement is ServiceTool) {
      serviceToolsCollection.doc(deletingElement.id).delete();
    }
  }


  ///metodo per accomunare le list dell'inventory con la map su firebase
  //TODO: riscrivere questo metodo secondo la struttura innestata che ho impostato
  Future<Map<String, dynamic>?> fetchDataFromFirebase() async {
    List list =[];
    List<Disposable> disposableList = [];
//https://stackoverflow.com/questions/46611369/get-all-from-a-firestore-collection-in-flutter#:~:text=This%20is%20the%20easiest%20way%20to%20get%20all%20data%20from%20collection%20that%20I%20found%20working%2C%20without%20using%20deprecated%20methods.
    //
    QuerySnapshot querySnapshot = await _disposablesCollection.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    list = allData;

    for(int i = 0; i < list.length ; i++) {
      disposableList.add(Disposable.returnADisposableFromMap(list[i]));

      print(list[i]['id']);
      print(disposableList.length);

    }

    inventory.disposables = disposableList;
    print('ciao ${inventory.disposables.length}');



  }


  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _disposablesCollection.get();
  //
  //
  //   for(int i = 0; i < querySnapshot.docs.length ; i++) {
  //     // Get data from docs and convert map to List
  //     final allData = querySnapshot.docs.map((doc) => doc.data());
  //
  //     print(allData);
  //   }

  // }




}