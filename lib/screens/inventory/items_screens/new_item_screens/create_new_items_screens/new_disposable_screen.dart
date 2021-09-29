import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:provider/provider.dart';


class NewDisposableItemScreen extends StatefulWidget {



  Disposable _newDisposableItem = Disposable(
      id: 'id',
      imageReference: 'imageReference',
      title: 'title',
      category: 'category',
      trashCan: 'trashCan',
      actualAvailability: 0,
      dealer: 'dealer',
      maxSupply: 0,
      purchasePrice: 0,
      sellingPrice: 0,
  );



  @override
  _NewDisposableItemScreenState createState() => _NewDisposableItemScreenState();
}

class _NewDisposableItemScreenState extends State<NewDisposableItemScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final _inventoryProvider = Provider.of<Inventory>(context);

    return Column(
      children: [

        SizedBox(height: 50,),

        Center(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(widget._newDisposableItem.imageReference),
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
                  initialValue: widget._newDisposableItem.title,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(fontSize: 22, color: Colors.blue)),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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
                  initialValue: widget._newDisposableItem.category,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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
                  initialValue: widget._newDisposableItem.dealer,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Dealer',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Dealer';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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
                  initialValue: widget._newDisposableItem.maxSupply.toString(),
                  //TODO verificare che il fatto che sia una string e non un int non crei problemi
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Max Supply',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Max Supply';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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
                  initialValue:
                      widget._newDisposableItem.actualAvailability.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Actual Availability',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide Actual Availability';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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
                  initialValue: widget._newDisposableItem.purchasePrice.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Purchase Price',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide Purchase Price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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
                  initialValue: widget._newDisposableItem.sellingPrice.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Selling Price',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide Selling Price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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

              ///form per la Trash Can -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newDisposableItem.trashCan,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Trash Can',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Trash Can';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Disposable disposable = widget._newDisposableItem;

                    print(value);
                    widget._newDisposableItem = Disposable(
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

              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();

                      setState(() {
                        _inventoryProvider.addNewElementToCorrectInventoryAndID(widget._newDisposableItem);
                      });

                      Navigator.pop(context);


                    },
                    child: const Text('Save'),
                  ),
                ),
              )
            ],
          ),
        ),


      ],
    );
  }
}
