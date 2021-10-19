import 'package:gestionale_main/models/real_items/inventory_item.dart';

/// qui descrivo un componente Disposable, ovvero usa e getta, come può essere una tovaglietta, una ciotola in cartone, un pacchetto di posate etc...

class Disposable extends InventoryItem {
  String id; //id univoco composto dalla lettera D di Disposable + il _title tutto maiuscolo, es "  D_TOVAGLIETTA  "
  final String title; //nome dell'oggetto
  final String category; // se necessario per bar, ristorante o caffetteria
  final String trashCan; // in quel bidone deve essere buttata
  String dealer; // fornitore
  double purchasePrice; // prezzo di acquisto
  double sellingPrice;
  int maxSupply; // massimo immagazzinamento
  int actualAvailability; // disponibilità attuale
  final String imageReference;

  Disposable({
    required this.id,
    required this.imageReference,
    required this.title,
    required this.category,
    required this.trashCan,
    required this.actualAvailability,
    required this.dealer,
    required this.maxSupply,
    required this.purchasePrice,
    required this.sellingPrice,
  }) : super(title, dealer , imageReference, actualAvailability); //

  static Map<String, dynamic> returnADisposableAsMap(Disposable disposable) {
    return {
      'id': disposable.id,
      'title': disposable.title,
      'category': disposable.category,
      'trashCan': disposable.trashCan,
      'dealer': disposable.dealer,
      'purchasePrice': disposable.purchasePrice,
      'sellingPrice': disposable.sellingPrice,
      'maxSupply': disposable.maxSupply,
      'actualAvailability': disposable.actualAvailability,
      'imageReference': disposable.imageReference
    };
  }

  static Disposable returnADisposableFromMap(disposableMap) {
    return Disposable(
        id: disposableMap['id'],
        imageReference: disposableMap['imageReference'],
        title: disposableMap['title'],
        category: disposableMap['category'],
        trashCan: disposableMap['trashCan'],
        actualAvailability: disposableMap['actualAvailability'],
        dealer: disposableMap['dealer'],
        maxSupply: disposableMap['maxSupply'],
        purchasePrice: disposableMap['purchasePrice'],
        sellingPrice: disposableMap['sellingPrice'],

    );
  }
}


// static Map<String, String> returnADisposableAsMap(Disposable disposable) {
//   return {
//     'id': disposable.id,
//     'title': disposable.title,
//     'category': disposable.category,
//     'trashCan': disposable.trashCan,
//     'dealer': disposable.dealer,
//     'purchasePrice': disposable.purchasePrice.toString(),
//     'sellingPrice': disposable.sellingPrice.toString(),
//     'maxSupply': disposable.maxSupply.toString(),
//     'actualAvailability': disposable.actualAvailability.toString(),
//     'imageReference': disposable.imageReference
//   };
// }
//
// static Disposable returnADisposableFromMap(disposableMap) {
//   return Disposable(id: disposableMap['id'],
//       imageReference: disposableMap['imageReference'],
//       title: disposableMap['title'],
//       category: disposableMap['category'],
//       trashCan: disposableMap['trashCan'],
//       actualAvailability: int.parse(disposableMap['actualAvailability']),
//       dealer: disposableMap['dealer'],
//       maxSupply: int.parse(disposableMap['maxSupply']),
//       purchasePrice: double.parse(disposableMap['purchasePrice']),
//       sellingPrice: double.parse(disposableMap['sellingPrice']),
//
//   );
// }
