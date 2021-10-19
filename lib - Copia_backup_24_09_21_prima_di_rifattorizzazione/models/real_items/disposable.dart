/// qui descrivo un componente Disposable, ovvero usa e getta, come può essere una tovaglietta, una ciotola in cartone, un pacchetto di posate etc...

class Disposable {


  final String title; //nome dell'oggetto
  final String category; // se necessario per bar, ristorante o caffetteria
  final String trashCan; // in quel bidone deve essere buttata
        String dealer; // fornitore
        double purchasePrice;// prezzo di acquisto
        double sellingPrice;
        int maxSupply; // massimo immagazzinamento
        int actualAvailability;// disponibilità attuale
  final String imageReference;

  Disposable( {
        required this.imageReference,
        required this.title,
        required this.category,
        required this.trashCan,
        required this.actualAvailability,
        required this.dealer,
        required this.maxSupply,
        required this.purchasePrice,
        required this.sellingPrice
      });  //






}