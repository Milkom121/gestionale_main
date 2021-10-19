/// creo il database dove verranno immagazzinate i clienti

import 'package:flutter/cupertino.dart';
import 'package:gestionale_main/models/users/customer.dart';

class Customers with ChangeNotifier {
  List<Customer> _allCustomers = [
    Customer(
        title: 'marco', surname: 'surname', telephoneNumber: '3334455666', email: 'user@main.com', location: 'Zingaria'),
    Customer(
        title: 'giorgio', surname: 'surname', telephoneNumber: '3334455666', email: 'user@main.com', location: 'Zingaria'),
    Customer(
        title: 'carlo', surname: 'surname', telephoneNumber: '3334455666', email: 'user@main.com', location: 'Zingaria'),
    Customer(
        title: 'marika', surname: 'surname', telephoneNumber: '3334455666', email: 'user@main.com', location: 'Zingaria'),
    Customer(
        title: 'valeria', surname: 'surname', telephoneNumber: '3334455666', email: 'user@main.com', location: 'Zingaria'),
    Customer(
        title: 'antonia', surname: 'surname', telephoneNumber: '3334455666', email: 'user@main.com', location: 'Zingaria'),
  ]; // in questa lista verranno immagazzinati tutti i clienti

  /// un getter che restituisce i costumers per ordine alfabetico sul nome
  List<Customer> get customers {
    return [..._allCustomers..sort((a, b) => a.title.compareTo(b.title))];
  }

  ///list di servizio viene riempita con gli elementi che corrispondono alla ricerca effettuata
  List<Customer> _foundCustomers = [];

  ///getter che restituisce la lista degli elementi corrispondenti ai parametri di recerca e che viene poi mostrata
  List<Customer> get foundCustomers {
    return [..._foundCustomers];
  }

  /// Metodo per cercare in realtime i clienti utilizzando la ricerca nel nome per ora, in futuro sarà una ricerca combinata name e surname
  void findCustomersByName(String customerSearchingText) {

    final List<Customer> foundMatchingElements = customers
        .where((element) => element.title.contains(customerSearchingText))
        .toList();

    if (foundMatchingElements.isNotEmpty) {
      _foundCustomers = foundMatchingElements;
      print(_foundCustomers.length);
    } else if (foundMatchingElements.isEmpty) {
      _foundCustomers = customers;
    }
    notifyListeners();
  }

  /// metodo che restituisce una lista di tutti i nomi di tutti i costumers
  List<String> listOfAllCustomersNames() {

    List<String> allNames = [];

    customers.forEach((element) {
      allNames.add(element.title);
    });

    return allNames;
  }
  // void findCustomersByName2(String searchingText) {
  //   customers.forEach((element) {
  //     if (element.name.contains(searchingText)) {
  //       _foundCustomers.add(element);
  //     } else {
  //       _foundCustomers.remove(element);
  //     }
  //   });
  //
  //   notifyListeners();
  // } //metodo alternativo ma attualmente non funzionante


  void addNewCustomer (Customer newCustomer){
    _allCustomers.add(newCustomer);
    notifyListeners();
  }



}


