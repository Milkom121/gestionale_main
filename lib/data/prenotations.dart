import 'package:flutter/cupertino.dart';
import 'package:gestionale_main/models/seats_prenotation.dart';
import 'package:gestionale_main/widgets/prenotation_list_tile.dart';
import 'package:intl/intl.dart';

/// in questo file verranno immagazzinate le prenotazioni relative a bar o ristorante

class Prenotations with ChangeNotifier {
  //List<BarPrenotation> barPrenotations = [];
  List<RestaurantPrenotation> _restaurantPrenotations = [];
  List<PoolPrenotation> poolPrenotations = [
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '2021-09-10',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '01/01/2011',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '01/01/2011',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '01-09-2021',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '01/01/2011',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '01/01/2011',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
    PoolPrenotation(
        title: 'Signor',
        surname: 'Mario',
        telephoneNumber: '1234567890',
        date: '01/01/2011',
        seatsId: '12',
        totalAmount: 12,
        done: false,
        numberOfCustomers: 4,
        prenotationDate: DateTime(2001, 3, 30),
        prenotationHour: DateFormat('hh:mm').format(DateTime.now()),
        seatsLocation: 'Busto Arsizio',
        prenotationNotes: 'allergia a stocazzo',
        elementsChosen: []),
  ]; //TODO creare un getter e rendere privata

  List<dynamic> foundPrenotations = [];

  ///questo getter ritorna una lista di tutte le prenotazioni
  List get allPrenotations {
    List _mergedList = List.from(_restaurantPrenotations)
      ..addAll(poolPrenotations);
    return _mergedList;
  }

  void addPrenotation(newPrenotation) {
    if (newPrenotation is PoolPrenotation) {
      poolPrenotations.add(newPrenotation);
    } else if (newPrenotation is RestaurantPrenotation) {
      _restaurantPrenotations.add(newPrenotation);
    }

    // else if (newPrenotation is BarPrenotation ) {
    //   barPrenotations.add(newPrenotation);
    // }

    notifyListeners();
  }

  //TODO creare un metodo che restituisca gli elementi cercati

  // List searchPrenotationsByDate(date)  {
  //   List<Object> foundPrenotations = [];
  //
  //   poolPrenotations.forEach((element) {
  //     if (element.date.contains(date)) {
  //       foundPrenotations.add(element);
  //     }
  //   });
  //
  //   _restaurantPrenotations.forEach((element) {
  //     if (element.date.contains(date)) {
  //       foundPrenotations.add(element);
  //     }
  //   });
  //
  //   return foundPrenotations;
  //
  // }

  ///questo metodo effettua una riecerca degli elementi desiderati e li aggiunge ad una lista che verrà poi visualizzata. ora sto provando ad unire le liste poolPrenotation e restaurantPrenotation, contando sul fatto che anche se gli elementi sono di tipo diverso hanno comunque il valore 'date', ma sembra non funzionare per ora, quindi:
  //TODO verificare il formato del valore 'date' del metodo qui sotto e confrontarlo col formato che passiamo con _selectedDay nel file PrenotationCalenrdarScreen, nel widget TableCalendar, nel metodo onSelected
  void searchPrenotationsByDate(DateTime date) {
    var newFormat = DateFormat("dd-MM-yyyy");

    String correctFormat = newFormat.format(date);

    final List<dynamic> foundMatchingElements = allPrenotations
        .where((element) => element.date.contains(correctFormat))
        .toList();

    if (foundMatchingElements.isNotEmpty) {
      foundPrenotations = foundMatchingElements;
      print(foundPrenotations.length);
    } else if (foundMatchingElements.isEmpty) {
      foundMatchingElements.add(
          PrenotationsListTile('Nothing\'s match with your enter', '', ''));
      foundPrenotations = foundMatchingElements;
    }
    print(correctFormat);
    notifyListeners();
  }
}
