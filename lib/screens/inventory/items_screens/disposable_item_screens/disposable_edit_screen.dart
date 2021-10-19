import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:provider/provider.dart';

///direttamente nel file della pagina di dettaglio dello schermo creo una pagina specifica per la modifica dei dati dell'oggetto

class DisposableEditScreen extends StatefulWidget {
  DisposableEditScreen(this._disposableObject);

  Disposable _disposableObject;

  @override
  _DisposableEditScreenState createState() => _DisposableEditScreenState();
}

class _DisposableEditScreenState extends State<DisposableEditScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<Inventory>(context);

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
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.black,
            onPressed: (){
              _formKey.currentState!.save();

              //inventoryProvider.updateElement(widget._disposableItem.id, widget._disposableItem);
              InventoryFirestore().updateElementOnFirebase(widget._disposableObject.id, widget._disposableObject);


              Navigator.pop(context);

            }
            ,
          ),
        ],
      ),
      body:

      StreamBuilder<QuerySnapshot>(
        stream: InventoryFirestore().disposablesCollection.snapshots(),
        builder: (context, snapshot)  {
          DocumentSnapshot disposableMap =
          snapshot.data!.docs[snapshot.data!.docs.indexWhere(
                  (element) => element.id == widget._disposableObject.id)];
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius:50,
                      child: Image.asset(disposableMap['imageReference']),
                    ),
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ///FORM PER IL TITOLO DELL'OGGETTO
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: disposableMap['title'],
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: 'Title',
                              labelStyle: TextStyle(fontSize: 22 , color: Colors.blue)
                            ),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              //TODO: trovare un modo per aggiornare il singolo campo, quello nel commento di seguito non funziona

                             // InventoryJson().updateElementFieldOnFirebase(widget._disposableObject.id, widget._disposableObject, 'title', value);



                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: value!,
                                category: disposable.category,
                                trashCan: disposable.trashCan,
                                actualAvailability: disposable.actualAvailability,
                                dealer: disposable.dealer,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
                          ),
                        ), // NOME

                        ///form per la Category -STRING-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.category,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(labelText: 'Category',
                                labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a Category';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: value!,
                                trashCan: disposable.trashCan,
                                actualAvailability: disposable.actualAvailability,
                                dealer: disposable.dealer,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
                          ),
                        ),

                        ///form per il Dealer -STRING-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.dealer,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(labelText: 'Dealer',
                              labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a Dealer';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: disposable.category,
                                trashCan: disposable.trashCan,
                                actualAvailability: disposable.actualAvailability,
                                dealer: value!,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
                          ),
                        ),

                        ///form per Max Supply -INT-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.maxSupply.toString(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Max Supply',
                              labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a Max Supply';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: disposable.category,
                                trashCan: disposable.trashCan,
                                actualAvailability: disposable.actualAvailability,
                                dealer: disposable.dealer,
                                maxSupply: int.parse(value!),
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
                          ),
                        ),

                        /// form per Actual Availability -INT-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.actualAvailability.toString(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(labelText: 'Actual Availability',
                                  labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide Actual Availability';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: disposable.category,
                                trashCan: disposable.trashCan,
                                actualAvailability: int.parse(value!),
                                dealer: disposable.dealer,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
                          ),
                        ),

                        /// form per Purchase Price -DOUBLE-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.purchasePrice.toString(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(labelText: 'Purchase Price',
                                  labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide Purchase Price';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: disposable.category,
                                trashCan: disposable.trashCan,
                                actualAvailability: disposable.actualAvailability,
                                dealer: disposable.dealer,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: double.parse(value!),
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
                          ),
                        ),

                        /// form per Selling Price -DOUBLE-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.sellingPrice.toString(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: 'Selling Price',
                              labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide Selling Price';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: disposable.category,
                                trashCan: disposable.trashCan,
                                actualAvailability: disposable.actualAvailability,
                                dealer: disposable.dealer,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: double.parse(value!),
                              );
                            },
                          ),
                        ),

                        ///form per la Trash Can -STRING-
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 35),
                          child: TextFormField(
                            initialValue: widget._disposableObject.trashCan,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(labelText: 'Trash Can',
                              labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                            //textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please provide a Trash Can';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              Disposable disposable = widget._disposableObject;

                              print(value);
                              widget._disposableObject = Disposable(
                                id: disposable.id,
                                imageReference: disposable.imageReference,
                                title: disposable.title,
                                category: disposable.category,
                                trashCan: value!,
                                actualAvailability: disposable.actualAvailability,
                                dealer: disposable.dealer,
                                maxSupply: disposable.maxSupply,
                                purchasePrice: disposable.purchasePrice,
                                sellingPrice: disposable.sellingPrice,
                              );
                            },
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
          );
        }
      ),
    );
  }
}
