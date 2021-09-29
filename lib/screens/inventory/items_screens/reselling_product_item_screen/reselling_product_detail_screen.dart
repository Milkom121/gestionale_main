import 'package:flutter/material.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/screens/inventory/items_screens/reselling_product_item_screen/reselling_product_edit_screen.dart';
import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';
import 'package:provider/provider.dart';

class ResellingProductDetailScreen extends StatefulWidget {
  ResellingProductDetailScreen(this.resellingProductObject);

  final ResellingProduct resellingProductObject;

  @override
  _ResellingProductDetailScreenState createState() => _ResellingProductDetailScreenState();
}

class _ResellingProductDetailScreenState extends State<ResellingProductDetailScreen> {
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
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ResellingProductEditScreen(widget.resellingProductObject)));
            }
            ,
          ),
        ],
      ),
      body:Consumer<Inventory>(builder: (context, inventory, child) {

    /// creo un riferimento all'oggetto presente effettivamente nel database, che è una entità diversa rispetto al Disposable che viene passato col costruttore, così da mostrare le modifiche in diretta in questo schermo
    ResellingProduct resellingProductObjectInInventory = inventory.resellingProducts[inventory.resellingProducts.indexWhere(
    (element) => element.id == widget.resellingProductObject.id)];

    return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                children: [

                  Center(
                    child: Column(
                      children: [
                        CircleAvatarImagePicker(null),
                        Text(
                          resellingProductObjectInInventory.title,
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
                              Text(resellingProductObjectInInventory.dealer)
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
                              Text(resellingProductObjectInInventory.purchasePrice
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
                              Text(resellingProductObjectInInventory.maxSupply
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
                                'Sell',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(resellingProductObjectInInventory.sellingPrice.toString()),
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
      );}
    ));
  }
}