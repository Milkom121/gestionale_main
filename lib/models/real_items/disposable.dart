/// qui descrivo un componente Disposable, ovvero usa e getta, come può essere una tovaglietta, una ciotola in cartone, un pacchetto di posate etc...

class Disposable {
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

  Disposable(
      {required this.id,
      required this.imageReference,
      required this.title,
      required this.category,
      required this.trashCan,
      required this.actualAvailability,
      required this.dealer,
      required this.maxSupply,
      required this.purchasePrice,
      required this.sellingPrice}); //

}
