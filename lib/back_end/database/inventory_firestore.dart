import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryFirestore with ChangeNotifier {


  ///questa variabile è un riferimento alla collection 'inventory' in firebase
  CollectionReference inventoryFirebaseCollection =
  FirebaseFirestore.instance.collection('Inventory');

  ///queste variabili invece si riferiscono ad un documento ('disposables' ,'ingredients'...) dentro la collection inventory
  CollectionReference disposablesCollection =
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


  ///metodo per aggiornare un elemento su Firebase, attualmente questa funzione viene svolta dallo stesso metodo gia esistente per la list inventory
  void updateElementOnFirebase(String id, modifiedElement) {
    if (modifiedElement is Disposable) {

      ///TODO compilare questa referenca con i dati dell'item da modificare
      disposablesCollection.doc(modifiedElement.id)
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



///IL METODO SEGUENTE NON è FUNZIONANTE
  ///metodo per aggiornare un singolo campo di un elemento su Firebase, attualmente questa funzione viene svolta dallo stesso metodo gia esistente per la list inventory
  void updateElementFieldOnFirebase(String id, modifiedElement , String updatingField , newValue) {
    if (modifiedElement is Disposable) {

      ///TODO compilare questa referenca con i dati dell'item da modificare
      disposablesCollection.doc(modifiedElement.id)
          .set({updatingField: newValue});
    }
    if (modifiedElement is Ingredient) {
      ///modifico l'elemento nel database online
      ingredientsCollection.doc(modifiedElement.id)
          .set({updatingField: newValue});
    }

    if (modifiedElement is ResellingProduct) {
      resellingProductsCollection.doc(modifiedElement.id)
          .set({updatingField: newValue});
    }
    if (modifiedElement is WorkTool) {
      workToolsCollection.doc(modifiedElement.id)
          .set({updatingField: newValue});
    }
    if (modifiedElement is ServiceTool) {
      serviceToolsCollection.doc(modifiedElement.title)
          .set({updatingField: newValue});
    }
  }


  ///metodo per salvare un elemento all'inventario Firebase
  Future<void> _addDataToFirebase(Map dataMap, savingPlaceReference,
      ) async {

    // NB: alla fine il gico si risolve tutto in collections che contengono documents che contengono collections etc... Quindi basta usare .doc('x').collection('y').doc('z').collection(...)...
    return savingPlaceReference
        .doc(dataMap['id'])
        .set(dataMap)
        .then((_) => print(" Added"))
        .catchError((error) => print("Failed to add : $error"));
  }

  /// metodo per aggiungere nuovi elementi nelle liste corrette
  void addNewElementToCorrectFirebaseCollection(newElement) {
    if (newElement is Disposable) {
      //aggiungo l'elemento alla corretta collezione su Firebase
      _addDataToFirebase(
          Disposable.returnADisposableAsMap(newElement),
          disposablesCollection,
          );

      print(newElement.id);
      print(newElement.title);
    }
    if (newElement is Ingredient) {
      _addDataToFirebase(
          Ingredient.returnAnIngredientAsMap(newElement),
          ingredientsCollection,
          );

      print(newElement.id);
      print(newElement.title);

    }
    if (newElement is ResellingProduct) {
      _addDataToFirebase(
          ResellingProduct.returnAResellingProductAsMap(newElement),
          resellingProductsCollection,
          );

      print(newElement.id);
    }
    if (newElement is ServiceTool) {
      _addDataToFirebase(
          ServiceTool.returnAServiceToolAsMap(newElement),
          serviceToolsCollection, );


      print(newElement.id);
    }
    if (newElement is WorkTool) {
      _addDataToFirebase(WorkTool.returnAWorkToolAsMap(newElement),
          workToolsCollection,
          );

      print(newElement.id);
    }
  }


  void deleteItemOnFirebase(deletingElement) {
    if (deletingElement is Disposable) {
      disposablesCollection.doc(deletingElement.id).delete();
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

/// metodo inutile
  Future<dynamic> findElementInACollectionById (elementToFind) async {

    if(elementToFind is Disposable){
      disposablesCollection.doc(elementToFind.id).get().then((DocumentSnapshot documentSnapshot) {
        return Disposable.returnADisposableFromMap(documentSnapshot);
      });


    }


  }


}









