import 'package:gestionale_main/models/users/customer.dart';

class Prenotation {
  final String title;
  final String surname;
  final String telephonNumber;
  final DateTime date;
  final int numberOfPeople;

  Prenotation(
      {required this.title,
      required this.surname,
      required this.telephonNumber,
      required this.date,
      required this.numberOfPeople});
}

class PoolPrenotation {
  final String title;
  final String surname;
  final String telephoneNumber;
  final String date;
  final int numberOfCustomers; //quanti sono
  final DateTime prenotationDate; // che giorno
  final String prenotationHour; // a che ora arrivano
  final String seatsLocation; // solarium o meno
  final String seatsId; // il numero del tavolo o della postazione piscina
  final String prenotationNotes; //se ci sono info aggiuntive di cui tenere conto
  final List<Object> elementsChosen; //tutto ciò che verrà consumato

  double totalAmount = 0.0; // totale della prenotazione
  bool done = false; // per confermare la chiusura della prenotazione

  PoolPrenotation({
    required this.title,
    required this.surname,
    required this.telephoneNumber,
    required this.date,
    required this.seatsId,
    required this.totalAmount,
    required this.done,
    required this.numberOfCustomers,
    required this.prenotationDate,
    required this.prenotationHour,
    required this.seatsLocation,
    required this.prenotationNotes,
    required this.elementsChosen,
  });
}


class RestaurantPrenotation {
  final String title;
  final String surname;
  final String telephoneNumber;
  final String date;
  final int numberOfCustomers; //quanti sono
  final DateTime prenotationDate; // che giorno
  final int prenotationHour; // a che ora arrivano
  final int seatsId; // il numero del tavolo
  final String prenotationNotes; //se ci sono info aggiuntive di cui tenere conto
  final List<Object> elementsChosen; //tutto ciò che verrà consumato

  double totalAmount = 0.0; // totale della prenotazione
  bool done = false; // per confermare la chiusura della prenotazione

  RestaurantPrenotation({
    required this.title,
    required this.surname,
    required this.telephoneNumber,
    required this.date,
    required this.seatsId,
    required this.totalAmount,
    required this.done,
    required this.numberOfCustomers,
    required this.prenotationDate,
    required this.prenotationHour,
    required this.prenotationNotes,
    required this.elementsChosen,
  });
}
