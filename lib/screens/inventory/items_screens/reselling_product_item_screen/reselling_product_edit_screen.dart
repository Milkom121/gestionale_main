import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_json.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:provider/provider.dart';

///direttamente nel file della pagina di dettaglio dello schermo creo una pagina specifica per la modifica dei dati dell'oggetto

class ResellingProductEditScreen extends StatefulWidget {
  ResellingProductEditScreen(this._resellingProductItem);

  ResellingProduct _resellingProductItem;

  @override
  _ResellingProductEditScreenState createState() =>
      _ResellingProductEditScreenState();
}

class _ResellingProductEditScreenState
    extends State<ResellingProductEditScreen> {
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
            onPressed: () {
              _formKey.currentState!.save();

              inventoryProvider.updateElement(widget._resellingProductItem.id,
                  widget._resellingProductItem);

              InventoryJson().updateElementOnFirebase(widget._resellingProductItem.id, widget._resellingProductItem);

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  child:
                      Image.asset(widget._resellingProductItem.imageReference),
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
                        initialValue: widget._resellingProductItem.title,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle:
                                TextStyle(fontSize: 22, color: Colors.blue)),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;

                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: value!,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: resellingProduct.dealer,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ), // NOME

                    ///form per la VARIETY -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._resellingProductItem.variety,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Variety',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Variety';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;

                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: resellingProduct.dealer,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: value!,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ),

                    ///form per il Dealer -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._resellingProductItem.dealer,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Dealer',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Dealer';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;
                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: value!,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ),

                    ///form per Max Supply -INT-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue:
                            widget._resellingProductItem.maxSupply.toString(),
                        //TODO verificare che il fatto che sia una string e non un int non crei problemi
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Max Supply',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Max Supply';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;

                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: resellingProduct.dealer,
                            maxSupply: int.parse(value!),
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ),

                    /// form per Actual Availability -INT-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget
                            ._resellingProductItem.actualAvailability
                            .toString(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Actual Availability',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide Actual Availability';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;

                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability: int.parse(value!),
                            dealer: resellingProduct.dealer,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ),

                    /// form per Purchase Price -DOUBLE-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._resellingProductItem.purchasePrice
                            .toString(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Purchase Price',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide Purchase Price';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;
                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: resellingProduct.dealer,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: double.parse(value!),
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ),

                    /// form per Selling Price -DOUBLE-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._resellingProductItem.sellingPrice
                            .toString(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Selling Price',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide Selling Price';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;
                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: resellingProduct.dealer,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: double.parse(value!),
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: resellingProduct.iva,
                            description: resellingProduct.description,
                          );
                        },
                      ),
                    ),

                    ///form per la IVA -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue:
                            widget._resellingProductItem.iva.toString(),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'IVA',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a IVA import';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          ResellingProduct resellingProduct =
                              widget._resellingProductItem;
                          print(value);
                          widget._resellingProductItem = ResellingProduct(
                            id: resellingProduct.id,
                            imageReference: resellingProduct.imageReference,
                            title: resellingProduct.title,
                            actualAvailability:
                                resellingProduct.actualAvailability,
                            dealer: resellingProduct.dealer,
                            maxSupply: resellingProduct.maxSupply,
                            purchasePrice: resellingProduct.purchasePrice,
                            sellingPrice: resellingProduct.sellingPrice,
                            variety: resellingProduct.variety,
                            commonName: resellingProduct.commonName,
                            iva: int.parse(value!),
                            description: resellingProduct.description,
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
      ),
    );
  }
}
