//TODO 2: vado a creare il modello di un prodotto pronto alla vendita, come può essere una bottiglia d'acqua o una lattina di cola

class ResellingProduct {
   String id;
  final String title;
  final String commonName;//TODO da eliminare
  final String description;//TODO da eliminare
  final int maxSupply;
  final String variety;
  final String dealer; //fornitore
  final double purchasePrice;
  final double sellingPrice; //prezzo di acquisto
  final int iva;
  final String imageReference;
  int actualAvailability;

  ResellingProduct(
      {
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
      required this.iva});


   static Map<String, String> returnAResellingProductAsMap(ResellingProduct resellingProduct) {
     return {
       'id': resellingProduct.id,
       'title': resellingProduct.title,
       'dealer': resellingProduct.dealer,
       'purchasePrice': resellingProduct.purchasePrice.toString(),
       'actualAvailability': resellingProduct.actualAvailability.toString(),
       'maxSupply': resellingProduct.maxSupply.toString(),
       'imageReference': resellingProduct.imageReference,
       'variety' :  resellingProduct.variety,
       'iva' : resellingProduct.iva.toString(),

     };
   }

}
