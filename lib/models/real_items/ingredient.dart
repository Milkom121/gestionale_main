import 'package:gestionale_main/models/real_items/inventory_item.dart';

/// qui andiamo a definire un iongredient, ovvero un prodotto finalizzato alla lavorazione, che non viene venduto singolarmente


class Ingredient extends InventoryItem{
  String id;
  final String imageReference;
  final String title; //nome del prodotto es: cipolle caramellate
  final String category; // se appartiene al bar, ristorante o caffetteria
  final bool alcoholic;
  final String measureUnit; // unità di misura utlizzata per il tipo di ingrediente
  double purchasePrice; // prezzo di acuqisto
  String dealer; // il nome del fornitore
  int packagesUnitsQuantity; // dimensione del collo es: cartone da sei latte di cipolle
  double singlePackMeasure; // peso dell'unità es: una latta pesa mezzo chilo
  int actualAvailability; // quantità attualmente disponibile
  final int maxPackagesSupply; // quantità massima immagazzinabile
  final String imageUrl;

  Ingredient({
    required this.id,
    required this.imageReference,
    required this.alcoholic,
    required this.imageUrl,
    required this.measureUnit,
    required this.title,
    required this.category,
    required this.maxPackagesSupply,
    required this.purchasePrice,
    required this.dealer,
    required this.actualAvailability,

    required this.packagesUnitsQuantity,
    required this.singlePackMeasure,
  }) : super(title, dealer , imageReference, actualAvailability) ;


  static Map<String, dynamic> returnAnIngredientAsMap(Ingredient ingredient) {
    return {
      'id': ingredient.id,
      'title': ingredient.title,
      'category': ingredient.category,
      'dealer': ingredient.dealer,
      'purchasePrice': ingredient.purchasePrice,
      'actualAvailability': ingredient.actualAvailability,
      'maxPackagesSupply': ingredient.maxPackagesSupply,
      'packagesUnitsQuantity': ingredient.packagesUnitsQuantity,
      'singlePackMeasure': ingredient.singlePackMeasure,
      'measureUnit': ingredient.measureUnit,
      'alcoholic': ingredient.alcoholic,
      'imageReference': ingredient.imageReference,
    };
  }


  //TODO capire perchè non riesco a vizualizzare gli ingredient
  static Ingredient returnAnIngredientFromMap(ingredientMap) {
    return Ingredient(
        id: ingredientMap['id'],
        imageReference: ingredientMap['imageReference'],
        alcoholic: ingredientMap['alcoholic'] == 'true' ? true : false,
        imageUrl: ingredientMap['imageUrl'],
        measureUnit: ingredientMap['measureUnit'],
        title: ingredientMap['title'],
        category: ingredientMap['category'],
        maxPackagesSupply: ingredientMap['maxPackagesSupply'],
        purchasePrice: ingredientMap['purchasePrice'],
        dealer: ingredientMap['dealer'],
        actualAvailability: ingredientMap['actualAvailability'],
        packagesUnitsQuantity: ingredientMap['packagesUnitsQuantity'],
        singlePackMeasure: ingredientMap['singlePackMeasure'],

    );
  }


}