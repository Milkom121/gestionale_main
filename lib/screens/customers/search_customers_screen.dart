import 'package:flutter/material.dart';
import 'package:gestionale_main/data/customers.dart';
import 'package:gestionale_main/models/users/customer.dart';
import 'package:gestionale_main/screens/customers/new_customer_screen.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';
import 'package:gestionale_main/widgets/customer_list_tile_widget.dart';
import 'package:provider/provider.dart';

class SearchCustomerScreen extends StatefulWidget {
  static const routeName = '/SearchCustomerScreen';
  final int screenIndex = 5;

  @override
  _SearchCustomerScreenState createState() => _SearchCustomerScreenState();
}

class _SearchCustomerScreenState extends State<SearchCustomerScreen> {

  ///metodo che ritorna una ListView aggiornata in tempo reale con il risultato della ricerca
  Widget returnSearchListView(List correctCustomersList) {
    final List _correctSortedCustomersList = correctCustomersList;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _correctSortedCustomersList.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomerListTile(
            _correctSortedCustomersList[index].title,
            _correctSortedCustomersList[index].telephoneNumber,
            _correctSortedCustomersList[index].location,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final customersProvider = Provider.of<Customers>(context);

    return Scaffold(
      bottomNavigationBar: AppNavigationBar(widget.screenIndex),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
            Navigator.pushNamed(context, NewCustomerScreen.routeName);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 0, bottom: 11, top: 11, right: 15),
                            hintText: "Search Customer"),
                            onChanged: (searchingText) {
                              setState(() {
                                  customersProvider
                                  .findCustomersByName(searchingText);
                                  print(searchingText);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///Ora ho bisogno che lo schermo alla prima apertura mostri la lista di tutti clienti quindi scelgo tra customers e foundCustomers:
            ///- all'avvio dello screen verrà mostrato customers,
            ///-una volta avviata la ricerca nella barra verrà invece mostrato foundCustomers con i risultati della ricerca
            Expanded(
                child: returnSearchListView(
                    customersProvider.foundCustomers.isEmpty
                        ? customersProvider.customers
                        : customersProvider.foundCustomers))

          ],
        ),
      ),
    );
  }
}
