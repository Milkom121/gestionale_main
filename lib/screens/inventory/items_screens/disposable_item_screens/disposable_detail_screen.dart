/// in questo schermo andrò a costruire la schermata che mostra tutti i dati dispoibili relativametne ad un oggetto tramite Text() widget.
/// In questa schermata inserirò un pulsante MODIFICA che consetirà di accedere ad uno schermo con i dati modificabili tramite TextFormFIeld()



import 'package:flutter/material.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/screens/inventory/items_screens/disposable_item_screens/disposable_edit_screen.dart';
import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';
import 'package:provider/provider.dart';

class DisposableDetailScreen extends StatefulWidget {

  DisposableDetailScreen(this.disposableObject);

  final Disposable disposableObject;





  @override
  _DisposableDetailScreenState createState() => _DisposableDetailScreenState();
}

class _DisposableDetailScreenState extends State<DisposableDetailScreen> {
  @override
  Widget build(BuildContext context) {



    // Disposable disposableObjectInInventory = widget.disposableObject[[disposables.indexWhere(
    //         (element) => element.id == modifiedElement.id)]]

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
             Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DisposableEditScreen(widget.disposableObject)));
            }
            ,
          ),
        ],
      ),
      body: Consumer<Inventory>(builder: (context, inventory, child) {

        /// creo un riferimento all'oggetto presente effettivamente nel database, che è una entità diversa rispetto al Disposable che viene passato col costruttore, così da mostrare le modifiche in diretta in questo schermo
        Disposable disposableObjectInInventory = inventory.disposables[inventory.disposables.indexWhere(
             (element) => element.id == widget.disposableObject.id)];

        return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              Center(
                child: Column(
                  children: [
                    CircleAvatarImagePicker(null),
                    Text(disposableObjectInInventory.title, style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Dealer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(disposableObjectInInventory.dealer)
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Max Supply',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(disposableObjectInInventory.maxSupply.toString()),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Buy Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(disposableObjectInInventory.purchasePrice.toString())
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Sell Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(disposableObjectInInventory.sellingPrice.toString()),
                      ],
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      );}
    ),);
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