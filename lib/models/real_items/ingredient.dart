
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
        int packageQuantity; // dimensione del collo es: cartone da sei latte di cipolle
        double singlePackWeight; // peso dell'unità es: una latta pesa mezzo chilo
        int actualAvailability; // quantità attualmente disponibile
  final int maxPackageSupply;// quantità massima immagazzinabile
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
        required this.maxPackageSupply,
        required this.purchasePrice,
        required this.dealer,
        required this.actualAvailability,

        required this.packageQuantity,
        required this.singlePackWeight});


}