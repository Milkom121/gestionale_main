import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_json.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:provider/provider.dart';

class NewResellingProductItemScreen extends StatefulWidget {
  ResellingProduct _newResellingProductItem = ResellingProduct(
    id: 'id',
    imageReference: 'imageReference',
    title: 'title',
    variety: 'variety',
    actualAvailability: 0,
    dealer: 'dealer',
    maxSupply: 0,
    purchasePrice: 0,
    description: '',
    sellingPrice: 0,
    commonName: '  ',
    iva: 0,
  );

  @override
  _NewResellingProductItemScreenState createState() =>
      _NewResellingProductItemScreenState();
}

class _NewResellingProductItemScreenState
    extends State<NewResellingProductItemScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _inventoryProvider = Provider.of<Inventory>(context);
    ResellingProduct _resellingProduct = widget._newResellingProductItem;
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(widget._newResellingProductItem.imageReference),
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
                  initialValue: widget._newResellingProductItem.title,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(fontSize: 22, color: Colors.blue)),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print(value);
                    widget._newResellingProductItem = ResellingProduct(
                      id: _resellingProduct.id,
                      imageReference: _resellingProduct.imageReference,
                      title: value!,
                      variety: _resellingProduct.variety,
                      actualAvailability: _resellingProduct.actualAvailability,
                      dealer: _resellingProduct.dealer,
                      maxSupply: _resellingProduct.maxSupply,
                      purchasePrice: _resellingProduct.purchasePrice,
                      iva: _resellingProduct.iva,
                      commonName: _resellingProduct.commonName,
                      sellingPrice: _resellingProduct.sellingPrice,
                      description: _resellingProduct.description,
                    );
                  },
                ),
              ), // NOME

              ///form per la Variety -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newResellingProductItem.variety,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Variety',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Variety';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print(value);
                    widget._newResellingProductItem = ResellingProduct(
                      id: _resellingProduct.id,
                      imageReference: _resellingProduct.imageReference,
                      title: _resellingProduct.variety,
                      variety: value!,
                      actualAvailability: _resellingProduct.actualAvailability,
                      dealer: _resellingProduct.dealer,
                      maxSupply: _resellingProduct.maxSupply,
                      purchasePrice: _resellingProduct.purchasePrice,
                      iva: _resellingProduct.iva,
                      commonName: _resellingProduct.commonName,
                      sellingPrice: _resellingProduct.sellingPrice,
                      description: _resellingProduct.description,
                    );
                  },
                ),
              ),

              ///form per il Dealer -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newResellingProductItem.dealer,
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
                    print(value);
                    widget._newResellingProductItem = ResellingProduct(
                      id: _resellingProduct.id,
                      imageReference: _resellingProduct.imageReference,
                      title: _resellingProduct.title,
                      variety: _resellingProduct.variety,
                      actualAvailability: _resellingProduct.actualAvailability,
                      dealer: value!,
                      maxSupply: _resellingProduct.maxSupply,
                      purchasePrice: _resellingProduct.purchasePrice,
                      iva: _resellingProduct.iva,
                      commonName: _resellingProduct.commonName,
                      sellingPrice: _resellingProduct.sellingPrice,
                      description: _resellingProduct.description,
                    );
                  },
                ),
              ),

              ///form per Max Supply -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newResellingProductItem.maxSupply
                      .toString(),
                  //TODO verificare che il fatto che sia una string e non un int non crei problemi
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Max Package Supply',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Max Package Supply';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print(value);
                    widget._newResellingProductItem = ResellingProduct(
                      id: _resellingProduct.id,
                      imageReference: _resellingProduct.imageReference,
                      title: _resellingProduct.title,
                      variety: _resellingProduct.variety,
                      actualAvailability: _resellingProduct.actualAvailability,
                      dealer: _resellingProduct.dealer,
                      maxSupply: int.parse(value!),
                      purchasePrice: _resellingProduct.purchasePrice,
                      iva: _resellingProduct.iva,
                      commonName: _resellingProduct.commonName,
                      sellingPrice: _resellingProduct.sellingPrice,
                      description: _resellingProduct.description,
                    );
                  },
                ),
              ),

              /// form per Actual Availability -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget
                      ._newResellingProductItem.actualAvailability
                      .toString(),
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
                    print(value);
                    widget._newResellingProductItem = ResellingProduct(
                      id: _resellingProduct.id,
                      imageReference: _resellingProduct.imageReference,
                      title: _resellingProduct.title,
                      variety: _resellingProduct.variety,
                      actualAvailability: int.parse(value!),
                      dealer: _resellingProduct.dealer,
                      maxSupply: _resellingProduct.maxSupply,
                      purchasePrice: _resellingProduct.purchasePrice,
                      iva: _resellingProduct.iva,
                      commonName: _resellingProduct.commonName,
                      sellingPrice: _resellingProduct.sellingPrice,
                      description: _resellingProduct.description,
                    );
                  },
                ),
              ),

              /// form per Purchase Price -DOUBLE-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue:
                      widget._newResellingProductItem.purchasePrice.toString(),
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


                    print(value);
                    widget._newResellingProductItem = ResellingProduct(
                      id: _resellingProduct.id,
                      imageReference: _resellingProduct.imageReference,
                      title: _resellingProduct.title,
                      variety: _resellingProduct.variety,
                      actualAvailability: _resellingProduct.actualAvailability,
                      dealer: _resellingProduct.dealer,
                      maxSupply: _resellingProduct.maxSupply,
                      purchasePrice: double.parse(value!),
                      iva: _resellingProduct.iva,
                      commonName: _resellingProduct.commonName,
                      sellingPrice: _resellingProduct.sellingPrice,
                      description: _resellingProduct.description,
                    );
                  },
                ),
              ),





              //TODO costruire il CheckBox
              Checkbox(value: false, onChanged: (bool) {}),




              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();

                      setState(() {
                        _inventoryProvider.addNewElementToCorrectInventoryAndID(widget._newResellingProductItem);
                      });

                      InventoryJson().addNewElementToCorrectFirebaseDocument(widget._newResellingProductItem);

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
