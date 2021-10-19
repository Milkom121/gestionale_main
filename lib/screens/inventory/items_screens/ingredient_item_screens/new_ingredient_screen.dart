import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:provider/provider.dart';

class NewIngredientItemScreen extends StatefulWidget {
  Ingredient _newIngredientItem = Ingredient(
    id: 'id',
    imageReference: 'imageReference',
    title: 'title',
    category: 'category',
    actualAvailability: 0,
    dealer: 'dealer',
    maxPackagesSupply: 0,
    purchasePrice: 0,
    packagesUnitsQuantity: 0,
    singlePackMeasure: 0,
    measureUnit: '  ',
    alcoholic: false,
    imageUrl: ' ',
  );

  @override
  _NewIngredientItemScreenState createState() =>
      _NewIngredientItemScreenState();
}

class _NewIngredientItemScreenState extends State<NewIngredientItemScreen> {
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final _inventoryProvider = Provider.of<Inventory>(context);
    //Ingredient ingredient = widget._newIngredientItem;
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(widget._newIngredientItem.imageReference),
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
                  initialValue: widget._newIngredientItem.title,
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

                    Ingredient ingredient = widget._newIngredientItem;

                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: value!,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ), // NOME

              ///form per la Category -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newIngredientItem.category,
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
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: value!,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              ///form per il Dealer -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newIngredientItem.dealer,
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
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: value!,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              ///form per Max Package Supply -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue:
                      widget._newIngredientItem.maxPackagesSupply.toString(),
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
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: int.parse(value!),
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              /// form per Actual Availability -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue:
                      widget._newIngredientItem.actualAvailability.toString(),
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
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: int.parse(value!),
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              /// form per Purchase Price -DOUBLE-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue:
                      widget._newIngredientItem.purchasePrice.toString(),
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
                    Ingredient ingredient = widget._newIngredientItem;

                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: double.parse(value!),
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              /// form per PACKAGE QUANTITY -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue:
                      widget._newIngredientItem.packagesUnitsQuantity.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Package Quantity',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide Package Quantity';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: int.parse(value!),
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              /// form per SINGLE PACK WEIGHT -DOUBLE-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue:
                      widget._newIngredientItem.singlePackMeasure.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Single Pack Weight',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide Single Pack Weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Ingredient ingredient = widget._newIngredientItem;

                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: double.parse(value!),
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              //TODO costruire il CheckBox
              Checkbox(
                  value: false,
                  onChanged: (bool) {}),

              ///form per il MEASURE UNIT -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newIngredientItem.measureUnit,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Measure Unit',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Measure Unit';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: value!,
                      imageUrl: ingredient.imageUrl,
                    );
                  },
                ),
              ),

              ///form per il IMAGE URL -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newIngredientItem.imageUrl,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Image Url',
                    labelStyle: TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Image Url';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Ingredient ingredient = widget._newIngredientItem;
                    print(value);
                    widget._newIngredientItem = Ingredient(
                      id: ingredient.id,
                      imageReference: ingredient.imageReference,
                      title: ingredient.title,
                      category: ingredient.category,
                      actualAvailability: ingredient.actualAvailability,
                      dealer: ingredient.dealer,
                      maxPackagesSupply: ingredient.maxPackagesSupply,
                      purchasePrice: ingredient.purchasePrice,
                      packagesUnitsQuantity: ingredient.packagesUnitsQuantity,
                      singlePackMeasure: ingredient.singlePackMeasure,
                      alcoholic: ingredient.alcoholic,
                      measureUnit: ingredient.measureUnit,
                      imageUrl: value!,
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
                        _inventoryProvider.addNewElementToCorrectInventoryAndID(widget._newIngredientItem);

                      });

                      InventoryFirestore().addNewElementToCorrectFirebaseCollection(widget._newIngredientItem);

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
