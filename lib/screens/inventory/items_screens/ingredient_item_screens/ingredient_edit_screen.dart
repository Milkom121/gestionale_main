import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:provider/provider.dart';

///direttamente nel file della pagina di dettaglio dello schermo creo una pagina specifica per la modifica dei dati dell'oggetto

class IngredientEditScreen extends StatefulWidget {
  IngredientEditScreen(this._ingredientItem);

  Ingredient _ingredientItem;

  @override
  _IngredientEditScreenState createState() => _IngredientEditScreenState();
}

class _IngredientEditScreenState extends State<IngredientEditScreen> {
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

              inventoryProvider.updateElement(
                  widget._ingredientItem.id, widget._ingredientItem);

              InventoryFirestore().updateElementOnFirebase(widget._ingredientItem.id, widget._ingredientItem);

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
                  child: Image.asset(widget._ingredientItem.imageReference),
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
                        initialValue: widget._ingredientItem.title,
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
                          Ingredient ingredient = widget._ingredientItem;

                          print(value);
                          widget._ingredientItem = Ingredient(
                            id: ingredient.id,
                            imageReference: ingredient.imageReference,
                            title: value!,
                            category: ingredient.category,
                            actualAvailability: ingredient.actualAvailability,
                            dealer: ingredient.dealer,
                            maxPackagesSupply: ingredient.maxPackagesSupply,
                            purchasePrice: ingredient.purchasePrice,
                            singlePackMeasure: ingredient.singlePackMeasure,
                            packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                            imageUrl: ingredient.imageUrl,
                            measureUnit: ingredient.measureUnit,
                            alcoholic: ingredient.alcoholic,
                          );
                        },
                      ),
                    ), // NOME

                    ///form per la Category -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._ingredientItem.category,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          labelStyle:
                              TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                        //textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a Category';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          Ingredient ingredient = widget._ingredientItem;

                          print(value);
                          widget._ingredientItem =Ingredient(
                            id: ingredient.id,
                            imageReference: ingredient.imageReference,
                            title: ingredient.title,
                            category: value!,
                            actualAvailability: ingredient.actualAvailability,
                            dealer: ingredient.dealer,
                            maxPackagesSupply: ingredient.maxPackagesSupply,
                            purchasePrice: ingredient.purchasePrice,
                            singlePackMeasure: ingredient.singlePackMeasure,
                            packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                            imageUrl: ingredient.imageUrl,
                            measureUnit: ingredient.measureUnit,
                            alcoholic: ingredient.alcoholic,
                          );
                        },
                      ),
                    ),

                    ///form per il Dealer -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._ingredientItem.dealer,
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
                          Ingredient ingredient = widget._ingredientItem;

                          print(value);
                          widget._ingredientItem = Ingredient(
                            id: ingredient.id,
                            imageReference: ingredient.imageReference,
                            title: ingredient.title,
                            category: ingredient.category,
                            actualAvailability: ingredient.actualAvailability,
                            dealer: value!,
                            maxPackagesSupply: ingredient.maxPackagesSupply,
                            purchasePrice: ingredient.purchasePrice,
                            singlePackMeasure: ingredient.singlePackMeasure,
                            packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                            imageUrl: ingredient.imageUrl,
                            measureUnit: ingredient.measureUnit,
                            alcoholic: ingredient.alcoholic,
                          );
                        },
                      ),
                    ),

                    ///form per Max Supply -INT-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue:
                            widget._ingredientItem.maxPackagesSupply.toString(),
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
                            return 'Please provide a Max Package Supply';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          Ingredient ingredient = widget._ingredientItem;

                          print(value);
                          widget._ingredientItem = Ingredient(
                            id: ingredient.id,
                            imageReference: ingredient.imageReference,
                            title: ingredient.title,
                            category: ingredient.category,
                            actualAvailability: int.parse(value!),
                            dealer: ingredient.dealer,
                            maxPackagesSupply: ingredient.maxPackagesSupply,
                            purchasePrice: ingredient.purchasePrice,
                            singlePackMeasure: ingredient.singlePackMeasure,
                            packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                            imageUrl: ingredient.imageUrl,
                            measureUnit: ingredient.measureUnit,
                            alcoholic: ingredient.alcoholic,
                          );
                        },
                      ),
                    ),

                    /// form per Actual Availability -INT-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._ingredientItem.actualAvailability
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
                          Ingredient ingredient = widget._ingredientItem;

                          print(value);
                          widget._ingredientItem = Ingredient(
                            id: ingredient.id,
                            imageReference: ingredient.imageReference,
                            title: ingredient.title,
                            category: ingredient.category,
                            actualAvailability:int.parse(value!),
                            dealer: ingredient.dealer,
                            maxPackagesSupply: ingredient.maxPackagesSupply,
                            purchasePrice: ingredient.purchasePrice,
                            singlePackMeasure: ingredient.singlePackMeasure,
                            packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                            imageUrl: ingredient.imageUrl,
                            measureUnit: ingredient.measureUnit,
                            alcoholic: ingredient.alcoholic,
                          );
                        },
                      ),
                    ),

                    /// form per Purchase Price -DOUBLE-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue:
                            widget._ingredientItem.purchasePrice.toString(),
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
                          Ingredient ingredient = widget._ingredientItem;

                          print(value);
                          widget._ingredientItem = Ingredient(
                            id: ingredient.id,
                            imageReference: ingredient.imageReference,
                            title:ingredient.title,
                            category: ingredient.category,
                            actualAvailability: ingredient.actualAvailability,
                            dealer: ingredient.dealer,
                            maxPackagesSupply: ingredient.maxPackagesSupply,
                            purchasePrice: double.parse(value!),
                            singlePackMeasure: ingredient.singlePackMeasure,
                            packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                            imageUrl: ingredient.imageUrl,
                            measureUnit: ingredient.measureUnit,
                            alcoholic: ingredient.alcoholic,
                          );
                        },
                      ),
                    ),


                    //TODO completare con i campi di inserimento delle altre proprietà di un ingredient


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
