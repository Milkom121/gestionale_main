//TODO 2: vado a creare il modello di un prodotto pronto alla vendita, come può essere una bottiglia d'acqua o una lattina di cola

class ResellingProduct {
  final String title;
  final String commonName;
  final String description;

  final String variety;
  final String dealer; //fornitore
  final double purchasePrice;
  final double sellingPrice; //prezzo di acquisto
  final int iva;
  final String imageReference;
  int actualAvailability;

  ResellingProduct(
      {required this.imageReference,
      required this.actualAvailability,
      required this.title,
      required this.commonName,
      required this.description,
      required this.variety,
      required this.dealer,
      required this.purchasePrice,
      required this.sellingPrice,
      required this.iva});
}
