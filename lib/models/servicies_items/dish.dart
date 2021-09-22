import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';

///Per questa applicazione dividerò i beni di consumo del Main Summer Club in
///-'Equipaggiamenti' tutta l'attrezzatura durevole di cui la struttura dispone,
///-'Disposable', ovvero tutto ciò che è usa e getta come posate in plastica, tovagliette, etc
///-'Eotazioni' ovvero le dotazioni della piscina (o altro) come lettini e ombrelloni ,
///-'Engredienti' ovvero le materie prime, 'Home Made Product' cioè ciò che viene venduto al cliente finale dopo una lavorazione o assemblaggio,
///-'Reselling Product' cioè un prodotto semplicemente comprato e rivenduto.

//TODO 1:  creo il modello di un 'Home Made Product' in vendita. Questo elemento rappresenta un oggetto derivante da una lavorazione

class Dish {
  final String name; //nome ufficiale
  final String commonName; // mome comune es "media chiara" per dire 'Lowenbrau alla spina media'
  final String category; // a quale area del menù appartiene, se ristorante, bar o caffetteriA
  final String description; // descrizione del prodotto
  final List necessaryRoles; // componenti dello staff necessarie alla produzione
  final List<Disposable> necessaryDisposable; // equipaggiamenti necessari a fornire il prodotto, come ad esempio piatti e posate da ristorante, non contano gli equipaggiamenti usa e getta che andranno invece sotto la voce 'ingrediants'*/
  final List<WorkTool> necessaryWorkTools;//strumenti necessari alla realizzazione
  final String variation; // qualora vi fossero variazioni
  final List<Ingredient> ingredients; //final List<Ingredient> ingredients; // ingredienti
  final double sellingPrice; //prezzo di vendita
  final double productionCost; //prezzo di produzione
  final Duration preparationTime; //tempo necessario alla preparazione
  final int iva; // percentuale di iva da esprimere tra 0 ed 1 (es: 10% diventa 0.1)

  Dish(
      { required this.name,
        required this.commonName,
        required this.category,
        required this.description,
        required this.variation,
        required this.ingredients,
        required this.sellingPrice,
        required this.productionCost,
        required this.preparationTime,
        required this.iva,
        required this.necessaryRoles,
        required this.necessaryDisposable,
        required this.necessaryWorkTools});

}
