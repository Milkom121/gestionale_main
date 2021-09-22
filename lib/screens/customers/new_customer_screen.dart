import 'package:flutter/material.dart';
import 'package:gestionale_main/data/customers.dart';
import 'package:gestionale_main/models/users/customer.dart';
import 'package:gestionale_main/screens/customers/search_customers_screen.dart';
import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';
import 'package:provider/provider.dart';

class NewCustomerScreen extends StatefulWidget {
  static const String routeName = "/AddNewCustomerScreen";

  @override
  _NewCustomerScreenState createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _formKey = GlobalKey<FormState>();

  // String _name = 'a';
  // String _surname = 'a';
  // String _telephoneNumber = 'a';
  // String _email = 'a';
  // String _location = 'a';

  Customer _newCustomer =
  Customer(title: 'nameeeee',
      surname: 'surname',
      telephoneNumber: 'telephoneNumber',
      email: 'email',
      location: 'location');

  //
  // void fillNewCustomerData(){
  //   _newCustomer.name = _name;
  //   _newCustomer.surname =_surname;
  //   _newCustomer.telephoneNumber = _telephoneNumber;
  //   _newCustomer.email = _email;
  //   _newCustomer.location = _location;
  // }

  @override
  Widget build(BuildContext context) {
    final customersProvider = Provider.of<Customers>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircleAvatarImagePicker(null),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ///FORM PER IL NOME
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: 'Name'),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          print(value);
                          _newCustomer = Customer(
                            title: value.toString(),
                            surname: _newCustomer.surname,
                            telephoneNumber: _newCustomer.telephoneNumber,
                            email: _newCustomer.email,
                            location: _newCustomer.location,
                          );
                        },
                      ),
                    ), // NOME
                    ///FORM PER IL COGNOME
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            icon: Icon(Icons.account_circle),
                            labelText: 'Surname'),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a surname';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _newCustomer = Customer(
                            title: _newCustomer.title,
                            surname: value.toString(),
                            telephoneNumber: _newCustomer.telephoneNumber,
                            email: _newCustomer.email,
                            location: _newCustomer.location,
                          );
                        },
                      ),
                    ), //COGNOME
                    ///FORM PER NUMERO TELEFONO
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone), labelText: 'Telephone'),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Number';
                          }
                          if (value.length != 10) {
                            return "Please provide a valid telephone number";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _newCustomer = Customer(
                            title: _newCustomer.title,
                            surname: _newCustomer.telephoneNumber,
                            telephoneNumber: value.toString(),
                            email: _newCustomer.email,
                            location: _newCustomer.location,
                          );
                        },
                      ),
                    ), //TELEPHONE NUMBER
                    ///FORM PER EMAIL
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.mail), labelText: 'Mail'),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Mail';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _newCustomer = Customer(
                            title: _newCustomer.title,
                            surname: _newCustomer.telephoneNumber,
                            telephoneNumber: _newCustomer.email,
                            email: value.toString(),
                            location: _newCustomer.location,
                          );
                        },
                      ),
                    ),

                    ///FORM PER PROVENIENZA
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.location_on_rounded),
                            labelText: 'Location'),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _newCustomer = Customer(
                            title: _newCustomer.title,
                            surname: _newCustomer.telephoneNumber,
                            telephoneNumber: _newCustomer.email,
                            email: _newCustomer.location,
                            location: value.toString(),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print('1');

                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Processing Data'),
                            ));
                            print('2');
                            _formKey.currentState!.save(); ///con questo metodo attivo i metodi onSaved dei vari form e salvano i dati in _newCustomer
                            print('3');


                            customersProvider.addNewCustomer(_newCustomer);


                            print('4');
                            Navigator.pushNamed(
                                context, SearchCustomerScreen.routeName);
                            print('5');
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
              // ListView.builder(
              //     itemCount: promo.promoItems.length  ,
              //     itemBuilder:(context, index) => PromoItem(title, imageUrl, price, description))
            ],
          ),
        ),
      ),
    );
  }
}


