


import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';


class DummyInventory with ChangeNotifier{
  List<Disposable> disposables = [
    Disposable(
      id: 'd1',
      title: 'Posate di plastica',
      category: 'Bar',
      trashCan: 'Plastica',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference: 'assets/images/mainsummer_logo.png',
      sellingPrice: 0.20,
    ),
    Disposable(
      id: 'd2',
      title: 'Tovagliette bar',
      category: 'Bar',
      trashCan: 'Carta',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference: 'assets/images/mainsummer_logo.png',
      sellingPrice: 0.20,
    ),
    Disposable(
      id: 'd3',
      title: 'Carta da forno',
      category: 'Cucina',
      trashCan: 'Carta',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference: 'assets/images/mainsummer_logo.png',
      sellingPrice: 0.20,
    ),
    Disposable(
      id: 'd4',
      title: 'Sacchetti  umido',
      category: 'Cucina , Bar',
      trashCan: 'Umido',
      actualAvailability: 100,
      dealer: 'Metro',
      maxSupply: 1000,
      purchasePrice: 0.20,
      imageReference: 'assets/images/mainsummer_logo.png',
      sellingPrice: 0.20,
    )
  ];




  /// metodo per trovare un singolo elemento per ID
  findElemetById(String itemId , List itemsList) {

    var foundElement =  itemsList.where((element) =>
        element.id.toLowerCase().contains(itemId));
    return foundElement;

  }

  /// Find a person in the list using indexWhere method.
  findPersonUsingIndexWhere(List<Disposable> list,
      String personName) {
    // Find the index of person. If not found, index = -1
    final index = list.indexWhere((element) =>
    element.id == personName);
    if (index >= 0) {
      print('Using indexWhere: ${list[index]}');
    }
  }

  /// Find a person in the list using [singleWhere] method.
  void findPersonUsingSingleWhere(List itemsList,
      String itemId) {
    // Note (from document):
    // 1. If exactly one element satisfies test,
    //    that element is returned.
    // 2. If more than one matching element is found,
    //    throws StateError.
    // 3. If no matching element is found,
    //    returns the result of orElse. If orElse is omitted,
    //    it defaults to throwing a StateError.
    final item = itemsList.singleWhere((element) =>
    element.name == itemId, orElse: () {
      return null;
    });

    print('Using singleWhere: ${item}');
  }


}


void main (){

 List list = DummyInventory().disposables;


 var foundElement = DummyInventory().findElemetById('d1', list);

 print(list.length);




}

//foods[foods.indexWhere((element) => element.uid == food.uid)]