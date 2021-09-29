/// in questo schermo andrò a costruire la schermata che mostra tutti i dati dispoibili relativametne ad un oggetto tramite Text() widget.
/// In questa schermata inserirò un pulsante MODIFICA che consetirà di accedere ad uno schermo con i dati modificabili tramite TextFormFIeld()

import 'package:flutter/material.dart';
import 'package:gestionale_main/data/inventory.dart';

import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';
import 'package:provider/provider.dart';

import 'ingredient_edit_screen.dart';

class IngredientDetailScreen extends StatefulWidget {
  IngredientDetailScreen(this.ingredientObject);

  final Ingredient ingredientObject;

  @override
  _IngredientDetailScreenState createState() => _IngredientDetailScreenState();
}

class _IngredientDetailScreenState extends State<IngredientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.black,
            onPressed: (){
              ///navigo verso la pagina di modifica dell'oggetto
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => IngredientEditScreen(widget.ingredientObject)));
            }
            ,
          ),
        ],
      ),
      body: Consumer<Inventory>(builder: (context, inventory, child) {

    /// creo un riferimento all'oggetto presente effettivamente nel database, che è una entità diversa rispetto al Disposable che viene passato col costruttore, così da mostrare le modifiche in diretta in questo schermo
    Ingredient ingredientObjectInInventory = inventory.ingredients[inventory.ingredients.indexWhere(
    (element) => element.id == widget.ingredientObject.id)];

    return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(

                  ),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatarImagePicker(null),
                        Text(
                          ingredientObjectInInventory.title,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///Left Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Dealer',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(ingredientObjectInInventory.dealer)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Buy Price',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(ingredientObjectInInventory.purchasePrice
                                  .toString())
                            ],
                          ),
                        ],
                      ),

                      ///Right Column
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Max Package Supply',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(ingredientObjectInInventory.maxPackageSupply
                                  .toString()),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Category',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(ingredientObjectInInventory.category),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )



              ),
        ),
      );},
    ));
  }
}

// Disposable(
//   title: 'Posate di plastica',
//   category: 'Bar',
//   trashCan: 'Plastica',
//   actualAvailability: 100,
//   dealer: 'Metro',
//   maxSupply: 1000,
//   purchasePrice: 0.20,
//   imageReference: 'image '
//   sellingPrice: 0.20,
// ),
