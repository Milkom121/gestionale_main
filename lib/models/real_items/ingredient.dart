
/// qui andiamo a definire un iongredient, ovvero un prodotto finalizzato alla lavorazione, che non viene venduto singolarmente




class Ingredient {
   String id;
  final String imageReference;
  final String title; //nome del prodotto es: cipolle caramellate
  final String category; // se appartiene al bar, ristorante o caffetteria
  final bool alcoholic;
  final String measureUnit;// unità di misura utlizzata per il tipo di ingrediente

        double purchasePrice; // prezzo di acuqisto
        String dealer; // il nome del fornitore
        int packagesUnitsQuantity; // dimensione del collo es: cartone da sei latte di cipolle
        double singlePackMeasure; // peso dell'unità es: una latta pesa mezzo chilo
        int actualAvailability; // quantità attualmente disponibile
  final int maxPackagesSupply;// quantità massima immagazzinabile
  final String imageUrl;

  Ingredient(

      {
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
        required this.singlePackMeasure,});





   static Map<String, String> returnAnIngredientAsMap(Ingredient ingredient) {
     return {
       'id': ingredient.id,
       'title': ingredient.title,
       'category': ingredient.category,
       'dealer': ingredient.dealer,
       'purchasePrice': ingredient.purchasePrice.toString(),
       'actualAvailability': ingredient.actualAvailability.toString(),
       'maxPackagesSupply': ingredient.maxPackagesSupply.toString(),
       'packagesUnitsQuantity' : ingredient.packagesUnitsQuantity.toString(),
       'singlePackMeasure' :ingredient.singlePackMeasure.toString(),
       'measureUnit' : ingredient.measureUnit,
       'alcoholic' : ingredient.alcoholic.toString(),
       'imageReference': ingredient.imageReference,
     };
   }





}