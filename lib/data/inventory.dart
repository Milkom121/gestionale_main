import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:gestionale_main/models/seats/restaurant_seats.dart';

/// qui definiamo l'Inventario, ovvero il file contenente tutto ciò che c'è e non c'è al Main
class Inventory with ChangeNotifier {
  /// inventario dei prodotti usa e getta
  List<Disposable> disposables = [
    Disposable(
      title: 'Posate di plastica',
      category: 'Bar',
      trashCan: 'Plastica',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference:
          'www.google.com/url?sa=i&url=http%3A%2F%2Fwww.deterbrill.com%2Fposate-bianche&psig=AOvVaw3_1rD6cX3mjPD5Deb3B4nj&ust=1624575550951000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLjAntftrvECFQAAAAAdAAAAABAG',
      sellingPrice: 0.20,
    ),
    Disposable(
      title: 'Tovagliette bar',
      category: 'Bar',
      trashCan: 'Carta',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference:
          'www.google.com/url?sa=i&url=http%3A%2F%2Fwww.deterbrill.com%2Fposate-bianche&psig=AOvVaw3_1rD6cX3mjPD5Deb3B4nj&ust=1624575550951000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLjAntftrvECFQAAAAAdAAAAABAG',
      sellingPrice: 0.20,
    ),
    Disposable(
      title: 'Carta da forno',
      category: 'Cucina',
      trashCan: 'Carta',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference:
          'www.google.com/url?sa=i&url=http%3A%2F%2Fwww.deterbrill.com%2Fposate-bianche&psig=AOvVaw3_1rD6cX3mjPD5Deb3B4nj&ust=1624575550951000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLjAntftrvECFQAAAAAdAAAAABAG',
      sellingPrice: 0.20,
    ),
    Disposable(
      title: 'Sacchetti  umido',
      category: 'Cucina , Bar',
      trashCan: 'Umido',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference:
          'www.google.com/url?sa=i&url=http%3A%2F%2Fwww.deterbrill.com%2Fposate-bianche&psig=AOvVaw3_1rD6cX3mjPD5Deb3B4nj&ust=1624575550951000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCLjAntftrvECFQAAAAAdAAAAABAG',
      sellingPrice: 0.20,
    )
  ];

  /// inventario degli ingredienti
  List<Ingredient> ingredients = [
    Ingredient(
      imageReference: 'assets/images/mainsummer_logo.png',
      measureUnit: 'kg',
      title: 'Pesto Genovese',
      category: 'Ristorante',
      maxPackageSupply: 10,
      purchasePrice: 1.0,
      dealer: 'Metro',
      actualAvailability: 5,

      packageQuantity: 1,
      unityWeight: 1,
      imageUrl:
          'wips.plug.it/cips/buonissimo.org/cms/2013/04/pesto-alla-genovese-6.jpg',
      alcoholic: false,
    ),


    Ingredient(
      imageReference: 'assets/images/mainsummer_logo.png',
      measureUnit: 'kg',
      title: 'Cipolla',
      category: 'Ristorante',
      maxPackageSupply: 10,
      purchasePrice: 1.0,
      dealer: 'Metro',
      actualAvailability: 5,

      packageQuantity: 1,
      unityWeight: 1,
      imageUrl:
      'wips.plug.it/cips/buonissimo.org/cms/2013/04/pesto-alla-genovese-6.jpg',
      alcoholic: false,
    ),

    Ingredient(
      imageReference: 'assets/images/mainsummer_logo.png',
      measureUnit: 'kg',
      title: 'Carote',
      category: 'Ristorante',
      maxPackageSupply: 10,
      purchasePrice: 1.0,
      dealer: 'Metro',
      actualAvailability: 5,

      packageQuantity: 1,
      unityWeight: 1,
      imageUrl:
      'wips.plug.it/cips/buonissimo.org/cms/2013/04/pesto-alla-genovese-6.jpg',
      alcoholic: false,
    ),

    Ingredient(
      imageReference: 'assets/images/mainsummer_logo.png',
      measureUnit: 'kg',
      title: 'Zucchine',
      category: 'Ristorante',
      maxPackageSupply: 10,
      purchasePrice: 1.0,
      dealer: 'Metro',
      actualAvailability: 5,

      packageQuantity: 1,
      unityWeight: 1,
      imageUrl:
      'wips.plug.it/cips/buonissimo.org/cms/2013/04/pesto-alla-genovese-6.jpg',
      alcoholic: false,
    ),

  ];

  /// inventario dei prodotti da rivendita
  List<ResellingProduct> resellingProducts = [
    ResellingProduct(
      title: 'Coca Cola Lattina',
      commonName: 'Coca',
      description: 'Una lattina rossa contenente CocaCola',
      variety: '33 cl',
      dealer: 'UICO',
      purchasePrice: 0.50,
      sellingPrice: 2.50,
      iva: 22,
      imageReference:
          'www.topbevande.it/images/thumbs/0085545_coca-cola-original-33cl-confezione-da-24-barattoli-lattina_780.jpeg',
      actualAvailability: 30,
    ),

    ResellingProduct(
      title: 'Fanta',
      commonName: 'Coca',
      description: 'Una lattina rossa contenente CocaCola',
      variety: '33 cl',
      dealer: 'UICO',
      purchasePrice: 0.50,
      sellingPrice: 2.50,
      iva: 22,
      imageReference:
      'www.topbevande.it/images/thumbs/0085545_coca-cola-original-33cl-confezione-da-24-barattoli-lattina_780.jpeg',
      actualAvailability: 30,
    ),

    ResellingProduct(
      title: 'Sprite',
      commonName: 'Coca',
      description: 'Una lattina rossa contenente CocaCola',
      variety: '33 cl',
      dealer: 'UICO',
      purchasePrice: 0.50,
      sellingPrice: 2.50,
      iva: 22,
      imageReference:
      'www.topbevande.it/images/thumbs/0085545_coca-cola-original-33cl-confezione-da-24-barattoli-lattina_780.jpeg',
      actualAvailability: 30,
    ),

  ];

  /// inventario degli strumenti di servizio
  List<ServiceTool> serviceTools = [
    ServiceTool(
        title: 'Martello',
        variety: 'Normale',
        actualAvailability: 1,
        imageReference:
            'https://images-na.ssl-images-amazon.com/images/I/61QanwisKgL._AC_SX425_.jpg',
    ),

    ServiceTool(
      title: 'Cacciavite',
      variety: 'Normale',
      actualAvailability: 1,
      imageReference:
      'https://images-na.ssl-images-amazon.com/images/I/61QanwisKgL._AC_SX425_.jpg',
    ),

  ];

  /// inventario degli strumenti di lavoro
  List<WorkTool> workTools = [
    WorkTool(
      imageReference:
          'images.eprice.it/nobrand/0/Lightbox/492/207547492/classic.jpg',
      title: 'Padella',
      category: 'Cucina',
      actualAvailability: 1,
    ),

    WorkTool(
      imageReference:
      'images.eprice.it/nobrand/0/Lightbox/492/207547492/classic.jpg',
      title: 'Coltello',
      category: 'Cucina',
      actualAvailability: 1,
    ),

    WorkTool(
      imageReference:
      'images.eprice.it/nobrand/0/Lightbox/492/207547492/classic.jpg',
      title: 'Coltello',
      category: 'Cucina',
      actualAvailability: 1,
    ),

  ];

  List<dynamic> _foundInventoryElements = [];

  List get foundInventoryElements  {
    return [..._foundInventoryElements];
  }

  /// getter che restituisce una lista di tutti gli elementi contenuti in tutte le liste
  List get allItemsInInventory {
    List allItemsList = [
      ...disposables,
      ...ingredients,
      ...resellingProducts,
      ...serviceTools,
      ...workTools
    ];
    return allItemsList;
  }

  /// metodo per aggiungere nuovi elementi nelle liste corrette
  void addNewElementToCorrectInventory(Object newElement) {
    if (newElement is Disposable) {
      disposables.add(newElement);
    }
    if (newElement is Ingredient) {
      ingredients.add(newElement);
    }
    if (newElement is ResellingProduct) {
      resellingProducts.add(newElement);
    }
    if (newElement is ServiceTool) {
      serviceTools.add(newElement);
    }
    if (newElement is WorkTool) {
      workTools.add(newElement);
    }
  }

  /// metodo per trovare tutti gli elementi per nome
  void findElemetsByName(String itemSearchingText) {
    final List<dynamic> foundMatchingElements = allItemsInInventory
        .where((element) => element.title.toLowerCase().contains(itemSearchingText))
        .toList();

    if (foundMatchingElements.isNotEmpty) {
      _foundInventoryElements = foundMatchingElements;
    }
    notifyListeners();
  }
}
