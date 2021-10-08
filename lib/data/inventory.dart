import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';


/// qui definiamo l'Inventario, ovvero il file contenente tutto ciò che c'è e non c'è al Main
class Inventory with ChangeNotifier {
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

  /// inventario dei prodotti usa e getta
  List<Disposable> disposables = [
    // Disposable(
    //   id: '',
    //   title: 'Posate di plastica',
    //   category: 'Bar',
    //   trashCan: 'Plastica',
    //   actualAvailability: 100,
    //   dealer: 'Metro',
    //   maxSupply: 1000,
    //   purchasePrice: 0.20,
    //   imageReference: 'assets/images/mainsummer_logo.png',
    //   sellingPrice: 0.20,
    // ),
  ];

  /// inventario degli ingredienti
  List<Ingredient> ingredients = [
    Ingredient(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      measureUnit: 'kg',
      title: 'Pesto Genovese',
      category: 'Ristorante',
      maxPackagesSupply: 10,
      purchasePrice: 1.0,
      dealer: 'Metro',
      actualAvailability: 5,
      packagesUnitsQuantity: 1,
      singlePackMeasure: 1,
      imageUrl:
          'https://wips.plug.it/cips/buonissimo.org/cms/2013/04/pesto-alla-genovese-6.jpg',
      alcoholic: false,
    ),
  ];

  /// inventario dei prodotti da rivendita
  List<ResellingProduct> resellingProducts = [
    ResellingProduct(
      id: '',
      title: 'Coca Cola Lattina',
      commonName: 'Coca',
      description: 'Una lattina rossa contenente CocaCola',
      variety: '33 cl',
      dealer: 'UICO',
      purchasePrice: 0.50,
      sellingPrice: 2.50,
      iva: 22,
      imageReference: 'assets/images/mainsummer_logo.png',
      actualAvailability: 30,
      maxSupply: 280,
    ),
  ];

  /// inventario degli strumenti di servizio
  List<ServiceTool> serviceTools = [
    ServiceTool(
      id: '',
      title: 'Martello',
      variety: 'Normale',
      actualAvailability: 1,
      imageReference: 'assets/images/mainsummer_logo.png',
    ),
  ];

  /// inventario degli strumenti di lavoro
  List<WorkTool> workTools = [
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Padella',
      category: 'Cucina',
      actualAvailability: 1,
    ),
  ];

  /// questa mappa contiene una copia dell'inventario completamente convertita in string, successivamente la convertirò in Json per il salvataggio su firebase
  Map<String, Map<String, String>> _inventoryAsMap = {};

  Map<String, Map<String, String>> get inventoryAsMap {
    return {..._inventoryAsMap};
  }

  List<dynamic> _foundInventoryElements = [];

  List get foundInventoryElements {
    return [..._foundInventoryElements];
  }

  /// getter che restituisce una lista di tutti gli elementi contenuti in tutte le liste
  List get allItemsInInventory {
    List _allItemsList = [
      ...disposables,
      ...ingredients,
      ...resellingProducts,
      ...serviceTools,
      ...workTools
    ];
    return _allItemsList;
  }

  /// getter che restituisce una lista conteneti le liste dei diversi items come disposables, ingredients, etc
  List get allListsOfInventoryItems {
    List<List> _allItemsList = [
      disposables,
      ingredients,
      resellingProducts,
      serviceTools,
      workTools
    ];
    return _allItemsList;
  }

  /// metodo che prende un ID ed un nuovo elemento modificato dell'inventario, utilizza l'ID per trovare il suo corrispondente nell'inventario e lo sostituisce con l'elemento modificato
  void updateElement(String id, modifiedElement) {
    if (modifiedElement is Disposable) {
      // indexwhere mi consente di restituire l'indice dell'elemento che cerco e mi consente di poterlo sostituire
      disposables[disposables.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;

      ///TODO compilare questa referenca con i dati dell'item da modificare
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Disposables')
          .update({modifiedElement.id: modifiedElement});
    }
    if (modifiedElement is Ingredient) {
      ///modifico l'elemento nella lista locale
      ingredients[ingredients.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;

      ///modifico l'elemento nel database online
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Ingredients')
          .update({modifiedElement.id: modifiedElement});
    }
    if (modifiedElement is ResellingProduct) {
      resellingProducts[resellingProducts.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Reselling_Products')
          .update({modifiedElement.id: modifiedElement});
    }
    if (modifiedElement is ServiceTool) {
      serviceTools[serviceTools.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Work_Tools')
          .update({modifiedElement.id: modifiedElement});
    }
    if (modifiedElement is WorkTool) {
      workTools[workTools.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;
      FirebaseFirestore.instance
          .collection('Inventory')
          .doc('Service_Tools')
          .update({modifiedElement.id: modifiedElement});
    }
    inventoryToMap();
    notifyListeners();
  }

  ///metodo per salvare un elemento all'inventario Firebase
  Future<void> addDataToCollectionFirebase(Map dataMap, savingPlaceReference, String nameOfTheInventoryList) async {

    DocumentReference ref = inventoryFirebaseCollection.doc(nameOfTheInventoryList);

 // NB: alla fine il gico si risolve tutto in collections che contengono documents che contengono collections etc... Quindi basta usare .doc('x').collection('y').doc('z').collection(...)...
    return savingPlaceReference.collection(dataMap['id']).doc(dataMap['title'])
        .set(dataMap)
        .then((value) => print(" Added"))
        .catchError((error) => print("Failed to add : $error"));
  }

  ///metodo per aggiornare un elemento su Firebase, attualmente questa funzione viene svolta dallo stesso metodo gia esistente per la list inventory

  Future<void> updateElementInFirebase(
      updatedElement, elementPositionInFirebase) {
    return FirebaseFirestore.instance
        .collection('collection_name')
        .doc('document_id')
        .update({'field_name': 'Some new data'});
  }

  /// metodo per aggiungere nuovi elementi nelle liste corrette
  void addNewElementToCorrectInventoryAndID(newElement) {
    if (newElement is Disposable) {
      newElement.id = 'D_${newElement.title}';
      disposables.add(newElement);
      //aggiungo l'elemento alla corretta collezione su Firebase
      addDataToCollectionFirebase(Disposable.returnADisposableAsMap(newElement),
          disposablesDocument, 'Disposables');

      // disposablesFirebaseCollection.add(Disposable.returnADisposableAsMap(newElement)).then((value) => print("Day Added"))
      //     .catchError((error) => print("Failed to add Day: $error"));
      // print(disposablesFirebaseCollection);

      print(newElement.id);
    }
    if (newElement is Ingredient) {
      newElement.id = 'I_${newElement.title}';
      ingredients.add(newElement);

      addDataToCollectionFirebase(
          Ingredient.returnAnIngredientAsMap(newElement),
          inventoryFirebaseCollection, 'Ingredients');

      print(newElement.id);
    }
    if (newElement is ResellingProduct) {
      newElement.id = 'R_${newElement.title}';
      resellingProducts.add(newElement);

      addDataToCollectionFirebase(
          ResellingProduct.returnAResellingProductAsMap(newElement),
          inventoryFirebaseCollection, 'Reselling_Prdocucts');

      print(newElement.id);
    }
    if (newElement is ServiceTool) {
      newElement.id = 'S_${newElement.title}';
      serviceTools.add(newElement);

      addDataToCollectionFirebase(
          ServiceTool.returnAServiceToolAsMap(newElement),
          inventoryFirebaseCollection, 'Work_Tools');

      print(newElement.id);
    }
    if (newElement is WorkTool) {
      newElement.id = 'W_${newElement.title}';
      workTools.add(newElement);

      addDataToCollectionFirebase(WorkTool.returnAWorkToolAsMap(newElement),
          inventoryFirebaseCollection , 'Service_Tools');

      print(newElement.id);
    }

    inventoryToMap();
    notifyListeners();
  }

  /// metodo per trovare tutti gli elementi per nome
  void findElemetsByName(String itemSearchingText) {
    final List<dynamic> foundMatchingElements = allItemsInInventory
        .where((element) =>
            element.title.toLowerCase().contains(itemSearchingText))
        .toList();

    if (foundMatchingElements.isNotEmpty) {
      _foundInventoryElements = foundMatchingElements;
    }
    notifyListeners();
  }

  /// metodo per trovare un singolo elemento per ID
  findElemetById(String itemId, List itemsList) {
    var foundElement = itemsList
        .indexWhere((element) => element.id.toLowerCase().contains(itemId));
    return foundElement;
  }

  /// metodo per rimuovere un elemento dall'inventario
  removeElementById(elementForDeleting) {
    if (elementForDeleting is Disposable) {
      disposables.removeWhere((element) => element.id == elementForDeleting.id);
    } else if (elementForDeleting is Ingredient) {
      ingredients.removeWhere((element) => element.id == elementForDeleting.id);
    } else if (elementForDeleting is ResellingProduct) {
      resellingProducts
          .removeWhere((element) => element.id == elementForDeleting.id);
    } else if (elementForDeleting is ServiceTool) {
      serviceTools
          .removeWhere((element) => element.id == elementForDeleting.id);
    } else if (elementForDeleting is WorkTool) {
      workTools.removeWhere((element) => element.id == elementForDeleting.id);
    }

    inventoryToMap();
    notifyListeners();
  }

  ///inizio metodi per ora inutili---------------------------------------------------------------
  void inventoryToMap() {
    Map<String, Map<String, String>> map = {};

    allItemsInInventory.forEach((element) {
      if (element is Disposable) {
        map.putIfAbsent(
            element.id, () => Disposable.returnADisposableAsMap(element));
      } else if (element is Ingredient) {
        map.putIfAbsent(
            element.id, () => Ingredient.returnAnIngredientAsMap(element));
      } else if (element is ResellingProduct) {
        map.putIfAbsent(element.id,
            () => ResellingProduct.returnAResellingProductAsMap(element));
      } else if (element is ServiceTool) {
        map.putIfAbsent(
            element.id, () => ServiceTool.returnAServiceToolAsMap(element));
      } else if (element is WorkTool) {
        map.putIfAbsent(
            element.id, () => WorkTool.returnAWorkToolAsMap(element));
      }
    });
    _inventoryAsMap = map;
  }

  ///fine metodi per ora inutili----------------------------------------------------------------

  ///metodo per accomunare le list dell'inventory con la map su firebase
  //TODO: riscrivere questo metodo secondo la struttura innestata che ho impostato
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
  }





  }
