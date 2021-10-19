//TODO 2: vado a creare il modello di un prodotto pronto alla vendita, come può essere una bottiglia d'acqua o una lattina di cola

import 'package:gestionale_main/models/real_items/inventory_item.dart';

class ResellingProduct extends InventoryItem {
  String id;
  final String title;
  final String commonName; //TODO da eliminare
  final String description; //TODO da eliminare
  final int maxSupply;
  final String variety;
  final String dealer; //fornitore
  final double purchasePrice;
  final double sellingPrice; //prezzo di acquisto
  final int iva;
  final String imageReference;
  int actualAvailability;

  ResellingProduct({
    required this.id,
    required this.maxSupply,
    required this.imageReference,
    required this.actualAvailability,
    required this.title,
    required this.commonName,
    required this.description,
    required this.variety,
    required this.dealer,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.iva ,
  }) : super(title, dealer , imageReference, actualAvailability);


  static Map<String, dynamic> returnAResellingProductAsMap(
      ResellingProduct resellingProduct) {
    return {
      'id': resellingProduct.id,
      'title': resellingProduct.title,
      'dealer': resellingProduct.dealer,
      'purchasePrice': resellingProduct.purchasePrice,
      'actualAvailability': resellingProduct.actualAvailability,
      'maxSupply': resellingProduct.maxSupply,
      'imageReference': resellingProduct.imageReference,
      'variety': resellingProduct.variety,
      'iva': resellingProduct.iva,

    };
  }

  static ResellingProduct returnAResellingProductFromMap(resellingProductMap) {
    return ResellingProduct(
        id: resellingProductMap['id'],
        maxSupply: int.parse(resellingProductMap['maxSupply']),
        imageReference: resellingProductMap['imageReference'],
        actualAvailability:int.parse(resellingProductMap ['actualAvailability']),
        title: resellingProductMap['title'],
        commonName: resellingProductMap['commonName'],
        description: resellingProductMap['description'],
        variety: resellingProductMap['variety'],
        dealer: resellingProductMap['dealer'],
        purchasePrice: double.parse(resellingProductMap['purchasePrice']),
        sellingPrice:  double.parse(resellingProductMap['sellingPrice']),
        iva: int.parse(resellingProductMap['iva']),
    );
  }

}
