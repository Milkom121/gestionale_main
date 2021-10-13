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



  /// metodo per aggiungere nuovi elementi nelle liste corrette
  void addNewElementToCorrectInventoryAndID(newElement) {
    if (newElement is Disposable) {
      newElement.id = 'D_${newElement.title}';
      disposables.add(newElement);


      // disposablesFirebaseCollection.add(Disposable.returnADisposableAsMap(newElement)).then((value) => print("Day Added"))
      //     .catchError((error) => print("Failed to add Day: $error"));
      // print(disposablesFirebaseCollection);

      print(newElement.id);
    }
    if (newElement is Ingredient) {
      newElement.id = 'I_${newElement.title}';
      ingredients.add(newElement);



      print(newElement.id);
    }
    if (newElement is ResellingProduct) {
      newElement.id = 'R_${newElement.title}';
      resellingProducts.add(newElement);



      print(newElement.id);
    }
    if (newElement is ServiceTool) {
      newElement.id = 'S_${newElement.title}';
      serviceTools.add(newElement);



      print(newElement.id);
    }
    if (newElement is WorkTool) {
      newElement.id = 'W_${newElement.title}';
      workTools.add(newElement);


      print(newElement.id);
    }

    inventoryToMap();
    notifyListeners();
  }


  /// metodo che prende un ID ed un nuovo elemento modificato dell'inventario, utilizza l'ID per trovare il suo corrispondente nell'inventario e lo sostituisce con l'elemento modificato
  void updateElement(String id, modifiedElement) {
    if (modifiedElement is Disposable) {
      // indexwhere mi consente di restituire l'indice dell'elemento che cerco e mi consente di poterlo sostituire
      disposables[disposables.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;


    }
    if (modifiedElement is Ingredient) {
      ///modifico l'elemento nella lista locale
      ingredients[ingredients.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;


    }
    if (modifiedElement is ResellingProduct) {
      resellingProducts[resellingProducts.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;

    }
    if (modifiedElement is ServiceTool) {
      serviceTools[serviceTools.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;

    }
    if (modifiedElement is WorkTool) {
      workTools[workTools.indexWhere(
          (element) => element.id == modifiedElement.id)] = modifiedElement;

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
   // _inventoryAsMap = map;
  }

  ///fine metodi per ora inutili----------------------------------------------------------------







  }
